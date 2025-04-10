//
//  MockAttemptsManagerProtocol.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 9/04/25.
//

@testable import MELIStoreCore


final class MockAttemptsManagerProperties: @unchecked Sendable {
    var executeWasCalled: Bool = false
}

struct MockAttemptsManagerProtocol: AttemptsManagerProtocol {
    private let mockProperties: MockPaginationManagerProperties
    
    init(
        mockProperties: MockPaginationManagerProperties = .init()
    ) {
        self.mockProperties = mockProperties
    }
    
    func execute<T>(
        maxAttempts: Int,
        _ block: @escaping @Sendable () async throws -> T
    ) async rethrows -> T where T: Sendable {
        mockProperties.startWasCalled = true
        return try await block()
    }
}
