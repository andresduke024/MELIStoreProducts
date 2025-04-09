//
//  MockPaginationManager.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 9/04/25.
//

@testable import MELIStoreProducts

final class MockPaginationManagerProperties: @unchecked Sendable {
    var startWasCalled: Bool = false
}

struct MockPaginationManagerProtocol: PaginationManagerProtocol {
    
    private let nextOffset: Int?
    
    private let mockProperties: MockPaginationManagerProperties
    
    init(
        nextOffset: Int? = nil,
        mockProperties: MockPaginationManagerProperties = .init()
    ) {
        self.nextOffset = nextOffset
        self.mockProperties = mockProperties
    }
    
    func start<T>(
        properties: MELIStoreProducts.PaginationProperties,
        execute getDataFromOffset: @escaping @Sendable (Int) async throws -> T
    ) async throws -> T where T: Sendable {
        mockProperties.startWasCalled = true
        return try await getDataFromOffset(nextOffset ?? 0)
    }
}
