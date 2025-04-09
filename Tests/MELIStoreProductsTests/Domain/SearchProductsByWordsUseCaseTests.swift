//
//  SearchProductsByWordsUseCaseTests.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 9/04/25.
//

import XCTest

@testable import MELIStoreProducts
@testable import SwiftDependencyInjector

final class SearchProductsByWordsUseCaseTests: XCTestCase {

    private var injector: Injector!

    override func setUpWithError() throws {
        injector = Injector.build(
            context: .tests(name: "SearchProductsByWordsUseCase")
        )
    }

    override func tearDownWithError() throws {
        injector = nil
    }

    private var id: String { "122535" }
    
    private var searchId: String { "0987654321" }
    
    private var inputEntity: ProductsSearchEntity {
        MockProductsSearchEntity.build(searchId: searchId, words: "", nextOffset: 0)
    }

    private func buildSUT(
        _ mockProductsRepository: MockProductsRepositoryProtocol,
        _ mockPaginationManager: MockPaginationManagerProtocol
    ) -> SearchProductsByWordsUseCase {
        injector.register(ProductsRepositoryProtocol.self) {
            mockProductsRepository
        }
        
        injector.register(PaginationManagerProtocol.self) {
            mockPaginationManager
        }

        return SearchProductsByWordsUseCase()
    }

    func testSuccessResult() async throws {
        // Arrange
        let entity = try XCTUnwrap(
            MockListProductEntity.build(id: id)
        )

        let mockResult: Result<[ListProductEntity], Error> = .success([entity])

        let sut = buildSUT(
            MockProductsRepositoryProtocol(searchResult: mockResult),
            MockPaginationManagerProtocol()
        )

        // Act
        let result = try await sut.invoke(data: inputEntity)

        // Assert
        XCTAssert(result.count == 1)
    }
    
    func testSuccessResultAndEnsurePaginationManagerCall() async throws {
        // Arrange
        let entity = try XCTUnwrap(
            MockListProductEntity.build(id: id)
        )

        let mockResult: Result<[ListProductEntity], Error> = .success([entity])

        let mockPaginationManagerProperties = MockPaginationManagerProperties()
        
        let sut = buildSUT(
            MockProductsRepositoryProtocol(searchResult: mockResult),
            MockPaginationManagerProtocol(mockProperties: mockPaginationManagerProperties)
        )

        // Act
        let _ = try await sut.invoke(data: inputEntity)

        // Assert
        XCTAssert(mockPaginationManagerProperties.startWasCalled)
    }

    func testFailureResult() async throws {
        // Arrange
        let mockResult: Result<[ListProductEntity], Error> = .failure(
            ProductSearchError.notFound
        )

        let sut = buildSUT(
            MockProductsRepositoryProtocol(searchResult: mockResult),
            MockPaginationManagerProtocol()
        )

        // Act / Assert
        await assertThrowsAsyncError(try await sut.invoke(data: inputEntity)) { error in
            let error = try XCTUnwrap(error as? ProductSearchError)

            XCTAssert(error == .notFound)
        }
    }
}
