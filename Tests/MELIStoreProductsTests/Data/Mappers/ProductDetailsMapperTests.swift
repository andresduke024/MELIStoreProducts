//
//  ProductDetailsMapperTests.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 9/04/25.
//

import XCTest

@testable import MELIStoreCore
@testable import MELIStoreProducts
@testable import SwiftDependencyInjector

final class ProductDetailsMapperTests: XCTestCase {

    private var injector: Injector!
    
    private var sut: ProductDetailsMapper!
    
    override func setUpWithError() throws {
        injector = Injector.build(
            context: .tests(name: "ProductDetailsMapper")
        )
        
        Injector.global.register(ProductAttributesMapper.self) {
            ProductAttributesMapper()
        }
        
        Injector.global.register(ProductPicturesMapper.self) {
            ProductPicturesMapper()
        }
        
        sut = ProductDetailsMapper()
    }

    override func tearDownWithError() throws {
        injector.destroy()
        Injector.global.destroy()
        sut = nil
    }

    private var id1: String { "1" }
    
    private var name1: String { "name1" }
    
    private var mockResponse: ProductDetailsResponse {
        MockProductDetailsResponse.build(
            id: id1,
            name: name1
        )
    }
    
    // MARK: mapRequest method tests
    
    func testShouldReturnValidRequestId() throws {
        // Act
        let result = try sut.mapRequest(id1)
        
        // Assert
        XCTAssert(result.id == id1)
    }
        
    // MARK: mapResponse method tests
    
    func testShouldThrowErrorDueToInvalidData() throws {
        // Arrange
        
        let mock = MockProductDetailsResponse.build()
        
        // Act / Assert
        XCTAssertThrowsError(try sut.mapResponse(mock))
    }
    
    func testOutputEntityResultShouldMapId() throws {
        // Act
        let result = try sut.mapResponse(mockResponse)
        
        // Assert
        XCTAssert(result.id == id1)
    }
    
    func testOutputEntityResultShouldMapName() throws {
        // Act
        let result = try sut.mapResponse(mockResponse)
        
        // Assert
        XCTAssert(result.name == name1)
    }
}
