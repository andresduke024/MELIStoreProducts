//
//  ProductsSearchObservableObjectTests.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 9/04/25.
//

import XCTest

@testable import MELIStoreProducts
@testable import SwiftDependencyInjector

final class ProductsSearchObservableObjectTests: XCTestCase {

    private var injector: Injector!

    override func setUpWithError() throws {
        injector = Injector.build(
            context: .tests(name: "ProductsSearchObservableObject")
        )
    }

    override func tearDownWithError() throws {
        Injector.global.destroy()
        injector.destroy()
        injector = nil
    }

    private var id: String { "1234567890" }
    
    private var searchText: String { "text" }
    
    private func buildSUT(
        text: String,
        _ mockSearchProductsByWordsUseCase: MockSearchProductsByWordsUseCaseProtocol
    ) async -> ProductsSearchObservableObject {
        
        injector.register(SearchProductsByWordsUseCaseProtocol.self) {
            mockSearchProductsByWordsUseCase
        }
        
        injector.register(ListProductUIMapper.self) {
            ListProductUIMapper()
        }
        
        Injector.global.register(AttributesUIMapper.self) {
            AttributesUIMapper()
        }
        
        return await ProductsSearchObservableObject(searchText: text)
    }
    
    func testStartSearchShouldLoadInitialProducts() async throws {
        // Arrange
        let mockEntity = try XCTUnwrap(MockListProductEntity.build(id: id))
        
        let mockResult: Result< [ListProductEntity], Error>? = .success([mockEntity])
        
        let sut = await buildSUT(
            text: searchText,
            MockSearchProductsByWordsUseCaseProtocol(result: mockResult)
        )
        
        // Act
        await sut.startSearch()
        
        // Assert
        let result = await sut.products
        
        XCTAssert(result.count == 1)
    }
    
    func testStartSearchShouldNotLoadProductsWhenSearchTextIsEmpty() async throws {
        // Arrange
        let mockEntity = try XCTUnwrap(MockListProductEntity.build(id: id))
        
        let mockResult: Result< [ListProductEntity], Error>? = .success([mockEntity])
        
        let sut = await buildSUT(
            text: "",
            MockSearchProductsByWordsUseCaseProtocol(result: mockResult)
        )
        
        // Act
        await sut.startSearch()
        
        // Assert
        let result = await sut.products
        
        XCTAssert(result.count == 0)
    }
    
    func testStartSearchShouldNotLoadProductsWhenIsAlreadyLoading() async throws {
        // Arrange
        let mockEntity = try XCTUnwrap(MockListProductEntity.build(id: id))
        
        let mockResult: Result< [ListProductEntity], Error>? = .success([mockEntity])
        
        let sut = await buildSUT(
            text: searchText,
            MockSearchProductsByWordsUseCaseProtocol(result: mockResult)
        )
        
        await MainActor.run {
            sut.isLoadingProducts.toggle()
        }
        
        // Act
        await sut.startSearch()
        
        // Assert
        let result = await sut.products
        
        XCTAssert(result.count == 0)
    }
    
    func testHandleProductsLoadShouldLoadProducts() async throws {
        // Arrange
        let mockEntity = try XCTUnwrap(MockListProductEntity.build(id: id))
        
        let mockResult: Result< [ListProductEntity], Error>? = .success([mockEntity])
        
        let sut = await buildSUT(
            text: searchText,
            MockSearchProductsByWordsUseCaseProtocol(result: mockResult)
        )
        
        // Act
        await sut.handleProductsLoad()
        
        // Assert
        let result = await sut.products
        
        XCTAssert(result.count == 1)
    }
    
    func testShouldCompleteSearchWithProductSearchError() async throws {
        // Arrange
        let mockResult: Result< [ListProductEntity], Error>? = .failure(
            ProductSearchError.failInSearch
        )

        let sut = await buildSUT(
            text: searchText,
            MockSearchProductsByWordsUseCaseProtocol(result: mockResult)
        )
        
        // Act
        await sut.startSearch()
        
        // Assert
        let result = await sut.searchError
        
        XCTAssertNotNil(result)
        XCTAssert(result == .failInSearch)
    }
    
    func testShouldCompleteSearchWithProductSearchUnknownError() async throws {
        // Arrange
        let mockResult: Result< [ListProductEntity], Error>? = .failure(
            MockError.general
        )

        let sut = await buildSUT(
            text: searchText,
            MockSearchProductsByWordsUseCaseProtocol(result: mockResult)
        )
        
        // Act
        await sut.startSearch()
        
        // Assert
        let result = await sut.searchError
        
        XCTAssertNotNil(result)
        XCTAssert(result == .unknown)
    }
    
    func testShouldCompleteSearchWithNotFoundUErrorWhenNoProductsLoaded() async throws {
        // Arrange
        let mockResult: Result< [ListProductEntity], Error>? = .success([])

        let sut = await buildSUT(
            text: searchText,
            MockSearchProductsByWordsUseCaseProtocol(result: mockResult)
        )
        
        // Act
        await sut.startSearch()
        
        // Assert
        let result = await sut.searchError
        
        XCTAssertNotNil(result)
        XCTAssert(result == .notFound)
    }
}
