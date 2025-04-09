//
//  ModuleEndpointsTests.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 9/04/25.
//

import XCTest

@testable import MELIStoreCore
@testable import MELIStoreProducts

final class ModuleEndpointsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testShouldReturnRightPathForSearchEndpoint() {
        // Act
        let result = ModuleEndpoints.search.path
        
        // Assert
        XCTAssert(result == ModuleConstants.productSearchEndpoint)
    }
    
    func testShouldReturnRightPathForDetailsEndpoint() {
        // Arrange
        let mockId = "mock_id"
        
        // Act
        let result = ModuleEndpoints.details(id: mockId).path
        
        // Assert
        XCTAssert(result == "\(CoreConstants.pathSeparator)\(mockId)")
    }
    
    func testShouldReturnRightAPIForSearchEndpoint() {
        // Act
        let result = ModuleEndpoints.search.api
        
        // Assert
        XCTAssert(result == ModuleConstants.productsAPI)
    }
    
    func testShouldReturnRightAPIForDetailsEndpoint() {
        // Arrange
        let mockId = "mock_id"
        
        // Act
        let result = ModuleEndpoints.details(id: mockId).api
        
        // Assert
        XCTAssert(result == ModuleConstants.productsAPI)
    }

}
