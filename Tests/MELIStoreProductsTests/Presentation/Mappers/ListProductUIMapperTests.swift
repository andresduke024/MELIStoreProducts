//
//  ListProductUIMapperTests.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 9/04/25.
//

import XCTest
@testable import MELIStoreProducts
@testable import MELIStoreDesignSystem
@testable import SwiftDependencyInjector

final class ListProductUIMapperTests: XCTestCase {

    private var injector: Injector!
    private var sut: ListProductUIMapper!
    
    override func setUpWithError() throws {
        injector = Injector.build(
            context: .tests(name: "ListProductUIMapper")
        )
        
        injector.register(AttributesUIMapper.self) {
            AttributesUIMapper()
        }
        
        sut = ListProductUIMapper()
    }
    
    override func tearDownWithError() throws {
        injector.destroy()
        
        injector = nil
        sut = nil
    }
    
    private var id1: String { "12345" }
    
    private var id2: String { "67890" }
    
    private var name1: String { "name1" }
    
    private var name2: String { "name2" }
    
    private var image1: String { "image1" }
    
    private var image2: String { "image2" }
   
    private var inputEntity: [ListProductEntity] {
        [
            MockListProductEntity.build(
                id: id1,
                name: name1,
                pictures: [
                    MockProductPictureEntity.build(
                        id: "",
                        url: image1,
                    )!
                ]
            )!,
            MockListProductEntity.build(
                id: id2,
                name: name2,
                pictures: [
                    MockProductPictureEntity.build(
                        id: "",
                        url: image2,
                    )!
                ]
            )!
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
        XCTAssert(result.contains(where: { $0.name == name1 }))
        XCTAssert(result.contains(where: { $0.name == name2 }))
    }
    
    func testResultShouldMapImage() throws {
        // Act
        let result = sut.map(inputEntity)
        
        // Assert
        XCTAssert(result.count == inputEntity.count)
        XCTAssert(result.contains(where: { $0.image == image1 }))
        XCTAssert(result.contains(where: { $0.image == image2 }))
    }
}
