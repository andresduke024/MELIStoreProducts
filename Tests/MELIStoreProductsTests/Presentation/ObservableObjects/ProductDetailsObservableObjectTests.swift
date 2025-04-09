//
//  ProductDetailsObservableObjectTests.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 9/04/25.
//

import XCTest

@testable import MELIStoreProducts
@testable import SwiftDependencyInjector

final class ProductDetailsObservableObjectTests: XCTestCase {

    private var injector: Injector!

    override func setUpWithError() throws {
        injector = Injector.build(
            context: .tests(name: "ProductDetailsObservableObject")
        )
    }

    override func tearDownWithError() throws {
        Injector.global.destroy()
        injector.destroy()
        injector = nil
    }

    private var id: String { "1234567890" }
    
    private func buildSUT(
        _ mockGetProductDetailsUseCase: MockGetProductDetailsUseCaseProtocol
    ) async -> ProductDetailsObservableObject {
        
        injector.register(GetProductDetailsUseCaseProtocol.self) {
            mockGetProductDetailsUseCase
        }
        
        injector.register(ProductDetailsUIMapper.self) {
            ProductDetailsUIMapper()
        }
        
        Injector.global.register(AttributesUIMapper.self) {
            AttributesUIMapper()
        }
        
        return await ProductDetailsObservableObject(id: id)
    }
    
    func testShouldLoadDetailsSuccess() async throws {
        // Arrange
        let mockEntity = try XCTUnwrap(MockProductDetailsEntity.build(id: id))
        
        let mockResult: Result<ProductDetailsEntity, Error>? = .success(mockEntity)
        
        let sut = await buildSUT(
            MockGetProductDetailsUseCaseProtocol(result: mockResult)
        )
        
        // Act
        await sut.loadDetails()
        
        // Assert
        let result = await sut.product
        
        XCTAssertNotNil(result)
    }
    
    func testShouldLoadDetailsWithProductDetailsError() async throws {
        // Arrange
        let mockResult: Result<ProductDetailsEntity, Error>? = .failure(
            ProductDetailsError.invalidData
        )
        
        let sut = await buildSUT(
            MockGetProductDetailsUseCaseProtocol(result: mockResult)
        )
        
        // Act
        await sut.loadDetails()
        
        // Assert
        let result = await sut.detailsError
        
        XCTAssertNotNil(result)
        XCTAssert(result == .invalidData)
    }
    
    func testShouldLoadDetailsWithUnknownProductDetailsError() async throws {
        // Arrange
        let mockResult: Result<ProductDetailsEntity, Error>? = .failure(
            MockError.general
        )
        
        let sut = await buildSUT(
            MockGetProductDetailsUseCaseProtocol(result: mockResult)
        )
        
        // Act
        await sut.loadDetails()
        
        // Assert
        let result = await sut.detailsError
        
        XCTAssertNotNil(result)
        XCTAssert(result == .unknown)
    }
}
