//
//  ProductDetailsUIMapperTests.swift
//  MELIStoreProductsTests
//
//  Created by Andres Duque on 9/04/25.
//

import XCTest
@testable import MELIStoreProducts
@testable import MELIStoreDesignSystem
@testable import SwiftDependencyInjector

final class ProductDetailsUIMapperTests: XCTestCase {

    private var injector: Injector!
    private var sut: ProductDetailsUIMapper!

    override func setUpWithError() throws {
        injector = Injector.build(
            context: .tests(name: "ProductDetailsUIMapper")
        )

        injector.register(AttributesUIMapper.self) {
            AttributesUIMapper()
        }

        sut = ProductDetailsUIMapper()
    }

    override func tearDownWithError() throws {
        injector.destroy()
        injector = nil
        sut = nil
    }

    private var id: String { "MLA123456" }
    
    private var name1: String { "Test Product" }
    
    private var shortDescription: String { "This is a test product" }
    
    private var picture1: String { "https://example.com/image1.jpg" }
    
    private var picture2: String { "https://example.com/image2.jpg" }
    
    private var mainFeature1: String { "Feature 1" }
    
    private var mainFeature2: String { "Feature 2" }
    
    private var inputEntity: ProductDetailsEntity {
        MockProductDetailsEntity.build(
            id: id,
            name: name1,
            shortDescription: shortDescription,
            pictures: [
                MockProductPictureEntity.build(id: "", url: picture1)!,
                MockProductPictureEntity.build(id: "", url: picture2)!
            ],
            mainFeatures: [mainFeature1, mainFeature2],
        )!
    }

    // MARK: - Tests

    func testShouldMapID() throws {
        // Act
        let result = sut.map(inputEntity)
        
        // Assert
        XCTAssertEqual(result.id, id)
    }

    func testShouldMapName() throws {
        // Act
        let result = sut.map(inputEntity)
        
        // Assert
        XCTAssertEqual(result.name, name1)
    }

    func testShouldMapDescription() throws {
        // Act
        let result = sut.map(inputEntity)
        
        // Assert
        XCTAssertEqual(result.description, shortDescription)
    }

    func testShouldMapPictures() throws {
        // Act
        let result = sut.map(inputEntity)
        
        // Assert
        XCTAssertEqual(result.pictures, [picture1, picture2])
    }

    func testShouldMapMainFeatures() throws {
        // Act
        let result = sut.map(inputEntity)
        
        // Assert
        XCTAssertEqual(result.mainFeatures.map(\.id), [mainFeature1, mainFeature2])
        XCTAssertEqual(result.mainFeatures.map(\.name), [mainFeature1, mainFeature2])
    }
}
