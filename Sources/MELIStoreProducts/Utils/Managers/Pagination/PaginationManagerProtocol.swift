//
//  PaginationManagerProtocol.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

protocol PaginationManagerProtocol: Sendable {
    func start<T: Sendable>(
        properties: PaginationProperties,
        execute getDataFromOffset: @Sendable @escaping (_ newInterval: Int) async throws -> T
    ) async throws -> T
}
