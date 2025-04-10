//
//  PaginationManagerTests.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 9/04/25.
//

import XCTest

@testable import MELIStoreCore
@testable import MELIStoreProducts
@testable import SwiftDependencyInjector

final class PaginationManagerTests: XCTestCase {

    private var injector: Injector!
    
    override func setUpWithError() throws {
        injector = Injector.build(
            context: .tests(name: "PaginationManager")
        )
    }

    override func tearDownWithError() throws {
        injector = nil
    }
    
    private func buildSUT(
        mockAttemptsManager: MockAttemptsManagerProtocol
    ) -> PaginationManager {
        injector.register(AttemptsManagerProtocol.self) {
            mockAttemptsManager
        }
        
        return PaginationManager()
    }
    
    func testShouldUseInitialPaginationIndex() async throws {
        // Arrange
        let properties = PaginationProperties(id: "123456")
        
        let sut = buildSUT(
            mockAttemptsManager: MockAttemptsManagerProtocol()
        )
        
        // Act
        try await sut.start(properties: properties) { result in
            // Assert
            XCTAssert(result == ModuleConstants.paginationStartIndex)
        }
    }
    
    func testShouldIncrementPaginationOnce() async throws {
        // Arrange
        let properties = PaginationProperties(
            id: "123456",
            interval: ModuleConstants.defaultProductSearchLimit
        )
        
        let sut = buildSUT(
            mockAttemptsManager: MockAttemptsManagerProtocol()
        )
        
        let expected = ModuleConstants.defaultProductSearchLimit
        
        // Act
        
        // Execute once to increment pagination on next execution (ignore this result).
        try await sut.start(properties: properties) { _ in }
        
        try await sut.start(properties: properties) { result in
            // Assert
            XCTAssert(result == expected)
        }
    }
    
    func testShouldIncrementPaginationTwice() async throws {
        // Arrange
        let properties = PaginationProperties(
            id: "123456",
            interval: ModuleConstants.defaultProductSearchLimit
        )
        
        let sut = buildSUT(
            mockAttemptsManager: MockAttemptsManagerProtocol()
        )
        
        let expected = ModuleConstants.defaultProductSearchLimit * 2
        
        // Act
        
        // Execute twice to increment pagination on final execution (ignore this results).
        try await sut.start(properties: properties) { _ in }
        try await sut.start(properties: properties) { _ in }
        
        try await sut.start(properties: properties) { result in
            // Assert
            XCTAssert(result == expected)
        }
    }
    
    func testShouldResetPaginationWhenPropertiesHasNewSearchId() async throws {
        // Arrange
        let properties = PaginationProperties(
            id: "123456",
            interval: ModuleConstants.defaultProductSearchLimit
        )
        
        let properties2 = PaginationProperties(
            id: "09876543",
            interval: ModuleConstants.defaultProductSearchLimit
        )
        
        let sut = buildSUT(
            mockAttemptsManager: MockAttemptsManagerProtocol()
        )
        
        let expected = ModuleConstants.paginationStartIndex
        
        // Act
        
        // Execute twice to increment pagination on final execution (ignore this results).
        try await sut.start(properties: properties) { _ in }
        try await sut.start(properties: properties) { _ in }
        
       
        try await sut.start(properties: properties2) { result in
            // Assert
            XCTAssert(result == expected)
        }
    }
}
