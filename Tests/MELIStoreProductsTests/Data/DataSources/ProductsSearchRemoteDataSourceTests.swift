//
//  ProductsSearchRemoteDataSourceTests.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 8/04/25.
//

import XCTest

@testable import MELIStoreCore
@testable import MELIStoreProducts
@testable import SwiftDependencyInjector

final class ProductsSearchRemoteDataSourceTests: XCTestCase {

    private let mockRequest = ProductsSearchQueryParams(words: "", offset: 0)

    private var mockKeywords: String { "mock_keywords" }

    private var mockResponse: ProductSearchResponse {
        MockProductSearchResponse.build(
            keywords: mockKeywords
        )
    }

    private var injector: Injector!

    override func setUpWithError() throws {
        injector = Injector.build(
            context: .tests(name: "ProductsSearchRemoteDataSource")
        )
    }

    override func tearDownWithError() throws {
        injector.destroy()
    }

    private func buildSUT(
        httpManager: MockHTTPManager,
    ) -> ProductsSearchRemoteDataSource {
        injector.register(HTTPManagerProtocol.self) { httpManager }

        return ProductsSearchRemoteDataSource()
    }

    func testShouldReturnValidResponse() async throws {
        // Arrange
        let mockHttpManager = MockHTTPManager(
            result: .success(mockResponse)
        )

        let sut = buildSUT(httpManager: mockHttpManager)

        // Act
        let result = try await sut.call(mockRequest)

        // Assert
        XCTAssert(result.keywords == mockKeywords)
    }

    func testShouldThrowNotFoundError() async throws {
        // Arrange
        let mockHttpManager = MockHTTPManager(
            result: .failure(RequestError.notFound)
        )

        let sut = buildSUT(httpManager: mockHttpManager)

        // Act / Assert
        await assertThrowsAsyncError(try await sut.call(mockRequest)) { error in
            let error = try XCTUnwrap(error as? ProductSearchError)

            XCTAssert(error == .notFound)
        }
    }

    func testShouldThrowFailInSearchError() async throws {
        // Arrange
        let mockHttpManager = MockHTTPManager(
            result: .failure(RequestError.fail)
        )

        let sut = buildSUT(httpManager: mockHttpManager)

        // Act / Assert
        await assertThrowsAsyncError(try await sut.call(mockRequest)) { error in
            let error = try XCTUnwrap(error as? ProductSearchError)

            XCTAssert(error == .failInSearch)
        }
    }
}
