//
//  ProductAttributesMapperTest.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 9/04/25.
//

import XCTest

@testable import MELIStoreCore
@testable import MELIStoreProducts

final class ProductAttributesMapperTests: XCTestCase {

    private var sut: ProductAttributesMapper!
    
    override func setUpWithError() throws {
        sut = ProductAttributesMapper()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    private var id1: String { "12345" }
    
    private var name1: String { "name1" }
    
    private var valueID1: String { "valueID1" }
    
    private var valueName1: String { "valueName1" }
    
    private var id2: String { "67890" }
    
    private var name2: String { "name2" }
    
    private var valueID2: String { "valueID2" }
    
    private var valueName2: String { "valueName2" }
    
    private var mockResponses: [ProductAttributeResponse] {
        [
            MockProductAttributeResponse.build(
                id: id1,
                name: name1,
                valueID: valueID1,
                valueName: valueName1,
            ),
            MockProductAttributeResponse.build(
                id: id2,
                name: name2,
                valueID: valueID2,
                valueName: valueName2,
            ),
        ]
    }
    
    func testResultShouldBeEmptyDueToNullDataAttributes() throws {
        // Act
        let result = try sut.mapResponse([
            MockProductAttributeResponse.build(),
            MockProductAttributeResponse.build(),
            MockProductAttributeResponse.build(),
        ])
        
        // Assert
        XCTAssert(result.count == 0)
    }
    
    func testResultShouldMapID() throws {
        // Act
        let result = try sut.mapResponse(mockResponses)
        
        // Assert
        XCTAssert(result.count == 2)
        XCTAssert(result.contains(where: { $0.id == id1 }))
        XCTAssert(result.contains(where: { $0.id == id2 }))
    }
    
    func testResultShouldMapName() throws {
        // Act
        let result = try sut.mapResponse(mockResponses)
        
        // Assert
        XCTAssert(result.count == mockResponses.count)
        XCTAssert(result.contains(where: { $0.name == name1 }))
        XCTAssert(result.contains(where: { $0.name == name2 }))
    }
    
    func testResultShouldMapValueID() throws {
        // Act
        let result = try sut.mapResponse(mockResponses)
        
        // Assert
        XCTAssert(result.count == mockResponses.count)
        XCTAssert(result.contains(where: { $0.valueID == valueID1 }))
        XCTAssert(result.contains(where: { $0.valueID == valueID2 }))
    }
    
    func testResultShouldMapValueName() throws {
        // Act
        let result = try sut.mapResponse(mockResponses)
        
        // Assert
        XCTAssert(result.count == mockResponses.count)
        XCTAssert(result.contains(where: { $0.valueName == valueName1 }))
        XCTAssert(result.contains(where: { $0.valueName == valueName2 }))
    }
}
