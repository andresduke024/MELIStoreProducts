//
//  ProductPictureMapper.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 9/04/25.
//

import XCTest

@testable import MELIStoreCore
@testable import MELIStoreProducts

final class ProductPicturesMapperTests: XCTestCase {

    private var sut: ProductPicturesMapper!
    
    override func setUpWithError() throws {
        sut = ProductPicturesMapper()
    }

    override func tearDownWithError() throws {
       sut = nil
    }
    
    private var id1: String { "1" }
    
    private var url1: String { "url1" }
    
    private var id2: String { "2" }
    
    private var url2: String { "url2" }
    
    private var mockResponses: [ProductPictureResponse] {
        [
            MockProductPictureResponse.build(
                id: id1,
                url: url1
            ),
            MockProductPictureResponse.build(
                id: id2,
                url: url2
            )
        ]
    }

    
    func testResultShouldBeEmptyDueToNullDataAttributes() throws {
        // Act
        let result = try sut.mapResponse([
            MockProductPictureResponse.build(),
            MockProductPictureResponse.build(),
            MockProductPictureResponse.build(),
        ])
        
        // Assert
        XCTAssert(result.count == 0)
    }
    
    func testResultShouldMapId() throws {
        // Act
        let result = try sut.mapResponse(mockResponses)
        
        // Assert
        XCTAssert(result.count == mockResponses.count)
        XCTAssert(result.contains(where: { $0.id == id1 }))
        XCTAssert(result.contains(where: { $0.id == id2 }))
    }
    
    func testResultShouldMapUrl() throws {
        // Act
        let result = try sut.mapResponse(mockResponses)
        
        // Assert
        XCTAssert(result.count == mockResponses.count)
        XCTAssert(result.contains(where: { $0.url == url1 }))
        XCTAssert(result.contains(where: { $0.url == url2 }))
    }
}
