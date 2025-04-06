//
//  PaginationManager.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

import MELIStoreCore
import SwiftDependencyInjector

actor PaginationManager: PaginationManagerProtocol {

    @Inject
    private var attemptsManager: AttemptsManagerProtocol
    
    private var paginationId: String
    private var lastPaginationOffset: Int

    init() {
        self.paginationId = ""
        self.lastPaginationOffset = ModuleConstants.paginationStartIndex
    }

    func start<T: Sendable>(
        properties: PaginationProperties,
        execute getDataFromOffset: @Sendable @escaping (_ newInterval: Int) async throws -> T
    ) async throws -> T {
        let mustRestorePagination = properties.id != paginationId

        let newOffset =
            mustRestorePagination
            ? ModuleConstants.paginationStartIndex
            : lastPaginationOffset + properties.interval

        if mustRestorePagination {
            paginationId = properties.id
            lastPaginationOffset = ModuleConstants.paginationStartIndex
        }

        let attempts =  CoreConstants.maxExecutionAttempts
        
        let result = try await attemptsManager.execute(maxAttempts: attempts) {
            try await getDataFromOffset(newOffset)
        }
        
        lastPaginationOffset = newOffset
        return result
    }
}
