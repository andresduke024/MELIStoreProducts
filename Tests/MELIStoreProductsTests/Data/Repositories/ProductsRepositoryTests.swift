//
//  ProductsRepositoryTests.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 8/04/25.
//

import XCTest

@testable import MELIStoreCore
@testable import MELIStoreProducts
@testable import SwiftDependencyInjector


final class ProductsRepositoryTests: XCTestCase {
    
    private var sut: ProductsRepository!
    
    private var injector: Injector!

    override func setUpWithError() throws {
        injector = Injector.build(
            context: .tests(name: "ProductsRepository")
        )
        
        injector.register(ProductsSearchRemoteDataSourceProtocol.self) {
            MockProductsSearchRemoteDataSource()
        }
        
        injector.register(ProductDetailsRemoteDataSourceProtocol.self) {
            MockProductDetailsRemoteDataSource()
        }
        
        injector.register(ProductSearchMapper.self) {
            ProductSearchMapper()
        }
        
        injector.register(ProductDetailsMapper.self) {
            ProductDetailsMapper()
        }
        
        Injector.global.register(ProductAttributesMapper.self) {
            ProductAttributesMapper()
        }
        
        Injector.global.register(ProductPicturesMapper.self) {
            ProductPicturesMapper()
        }
        
        sut = ProductsRepository()
    }

    override func tearDownWithError() throws {
        injector.destroy()
        Injector.global.destroy()
        injector = nil
        sut = nil
    }
    
    func testShouldReturnValidResponseOnSearch() async throws {
        // Arrange
        let mockSearchEntity = MockProductsSearchEntity.build(searchId: "", words: "", nextOffset: 0)
        
        // Act / Assert
        await assertThrowsNotErrorAsync(try await sut.search(mockSearchEntity))
    }
    
    func testShouldReturnValidResponseOnGetById() async throws {
        // Arrange
        let mockId = "mock_id"
        
        // Act / Assert
        await assertThrowsNotErrorAsync(try await sut.get(mockId))
    }
}
