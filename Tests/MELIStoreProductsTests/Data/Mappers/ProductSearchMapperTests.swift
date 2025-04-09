//
//  ProductSearchMapperTests.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 9/04/25.
//

import XCTest

@testable import MELIStoreCore
@testable import MELIStoreProducts
@testable import SwiftDependencyInjector

final class ProductSearchMapperTests: XCTestCase {

    private var injector: Injector!
    
    private var sut: ProductSearchMapper!
    
    override func setUpWithError() throws {
        injector = Injector.build(
            context: .tests(name: "ProductSearchMapper")
        )
        
        Injector.global.register(ProductAttributesMapper.self) {
            ProductAttributesMapper()
        }
        
        Injector.global.register(ProductPicturesMapper.self) {
            ProductPicturesMapper()
        }
        
        sut = ProductSearchMapper()
    }

    override func tearDownWithError() throws {
        injector.destroy()
        Injector.global.destroy()
        sut = nil
    }
    
    private var words: String { "words to search" }
    
    private var offset: Int { 10 }
    
    private var mockInputEntity: ProductsSearchEntity {
        MockProductSearchEntity.build(
            words: words,
            nextOffset: offset
        )
    }
    
    private var id1: String { "1" }
    
    private var name1: String { "name1" }
    
    private var id2: String { "2" }
    
    private var name2: String { "name2" }
    
    private var mockResponse: ProductSearchResponse {
        MockProductSearchResponse.build(
            results: [
                MockProductResponse.build(id: id1, name: name1),
                MockProductResponse.build(id: id2, name: name2)
            ]
        )
    }
    
    // MARK: mapRequest method tests
    
    func testShouldReturnValidQueryParamForSearch() throws {
        // Act
        let result = try sut.mapRequest(mockInputEntity)
        
        // Assert
       try validateRequestResult(result, key: "q", expected: words)
    }
    
    func testShouldReturnValidQueryParamForOffset() throws {
        // Act
        let result = try sut.mapRequest(mockInputEntity)
        
        // Assert
       try validateRequestResult(result, key: "offset", expected: offset)
    }
    
    func testShouldReturnValidQueryParamForStatus() throws {
        // Act
        let result = try sut.mapRequest(mockInputEntity)
        
        // Assert
       try validateRequestResult(
            result,
            key: "status",
            expected: ModuleConstants.defaultProductSearchStatus
       )
    }

    func testShouldReturnValidQueryParamForSiteId() throws {
        // Act
        let result = try sut.mapRequest(mockInputEntity)
        
        // Assert
       try validateRequestResult(
            result,
            key: "site_id",
            expected: ModuleConstants.defaultProductSearchSiteId
       )
    }
    
    func testShouldReturnValidQueryParamForLimit() throws {
        // Act
        let result = try sut.mapRequest(mockInputEntity)

        // Assert
        try validateRequestResult(
            result,
            key: "limit",
            expected: ModuleConstants.defaultProductSearchLimit
        )
    }

    // MARK: mapResponse method tests
    
    func testShouldReturnEmptyArrayDueToNullValuesOnResponse() throws {
        // Act
        let result = try sut.mapResponse(
            MockProductSearchResponse.build()
        )

        // Assert
        XCTAssert(result.count == 0)
    }
    
    func testOutputEntityResultShouldMapId() throws {
        // Act
        let result = try sut.mapResponse(mockResponse)
        
        // Assert
        XCTAssert(result.count == mockResponse.results?.count)
        XCTAssert(result.contains(where: { $0.id == id1 }))
        XCTAssert(result.contains(where: { $0.id == id2 }))
    }
    
    func testOutputEntityResultShouldMapName() throws {
        // Act
        let result = try sut.mapResponse(mockResponse)
        
        // Assert
        XCTAssert(result.count == mockResponse.results?.count)
        XCTAssert(result.contains(where: { $0.name == name1 }))
        XCTAssert(result.contains(where: { $0.name == name2 }))
    }
    
    // MARK: Utils
    
    private func validateRequestResult<T: Equatable>(
        _ request: ProductsSearchQueryParams,
        key: String,
        expected: T
    ) throws {
        let result = request.transform()
        
        let value = try XCTUnwrap(result[key] as? T)
        
        XCTAssert(value == expected)
    }
    
}
