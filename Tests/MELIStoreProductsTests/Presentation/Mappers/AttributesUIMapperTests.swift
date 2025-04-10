//
//  AttributesUIMapperTests.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 9/04/25.
//

import XCTest
@testable import MELIStoreProducts
@testable import MELIStoreDesignSystem

final class AttributesUIMapperTests: XCTestCase {

    private var sut: AttributesUIMapper!
    
    override func setUpWithError() throws {
        sut = AttributesUIMapper()
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
    
    private var inputEntity: [ProductAttributeEntity] {
        [
            MockProductAttributeEntity.build(
                id: id1,
                name: name1,
                valueID: valueID1,
                valueName: valueName1,
            )!,
            MockProductAttributeEntity.build(
                id: id2,
                name: name2,
                valueID: valueID2,
                valueName: valueName2,
            )!,
        ]
    }
    
    func testResultShouldMapID() throws {
        // Act
        let result = sut.map(inputEntity)
        
        // Assert
        XCTAssert(result.count == inputEntity.count)
        XCTAssert(result.contains(where: { $0.id == id1 }))
        XCTAssert(result.contains(where: { $0.id == id2 }))
    }
    
    func testResultShouldMapName() throws {
        // Act
        let result = sut.map(inputEntity)
        
        // Assert
        XCTAssert(result.count == inputEntity.count)
        XCTAssert(result.contains(where: { $0.name == "\(name1):" }))
        XCTAssert(result.contains(where: { $0.name == "\(name2):" }))
    }
    
    func testResultShouldMapValueID() throws {
        // Act
        let result = sut.map(inputEntity)
        
        // Assert
        XCTAssert(result.count == inputEntity.count)
        XCTAssert(result.contains(where: { $0.description == valueName1 }))
        XCTAssert(result.contains(where: { $0.description == valueName2 }))
    }
}
