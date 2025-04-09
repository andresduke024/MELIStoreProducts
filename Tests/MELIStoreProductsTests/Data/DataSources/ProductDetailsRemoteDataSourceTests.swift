//
//  ProductDetailsRemoteDataSourceTests.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 8/04/25.
//

import XCTest

@testable import MELIStoreCore
@testable import MELIStoreProducts
@testable import SwiftDependencyInjector

final class ProductDetailsRemoteDataSourceTests: XCTestCase {

    private let mockRequest = ProductDetailsRequest(id: "")

    private var mockId: String { "mock_id" }

    private var mockResponse: ProductDetailsResponse {
        MockProductDetailsResponse.build(id: mockId)
    }

    private var injector: Injector!

    override func setUpWithError() throws {
        injector = Injector.build(
            context: .tests(name: "ProductDetailsRemoteDataSource")
        )
    }

    override func tearDownWithError() throws {
        injector.destroy()
        injector = nil
    }

    private func buildSUT(
        httpManager: MockHTTPManager,
    ) -> ProductDetailsRemoteDataSource {
        injector.register(HTTPManagerProtocol.self) { httpManager }

        return ProductDetailsRemoteDataSource()
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
        XCTAssert(result.id == mockId)
    }

    func testShouldThrowInvalidDataError() async throws {
        // Arrange
        let mockHttpManager = MockHTTPManager(
            result: .failure(RequestError.notFound)
        )

        let sut = buildSUT(httpManager: mockHttpManager)

        // Act / Assert
        await assertThrowsAsyncError(try await sut.call(mockRequest)) { error in
            let error = try XCTUnwrap(error as? ProductDetailsError)

            XCTAssert(error == .invalidData)
        }
    }

    func testShouldThrowUnknownError() async throws {
        // Arrange
        let mockHttpManager = MockHTTPManager(
            result: .failure(RequestError.fail)
        )

        let sut = buildSUT(httpManager: mockHttpManager)

        // Act / Assert
        await assertThrowsAsyncError(try await sut.call(mockRequest)) { error in
            let error = try XCTUnwrap(error as? ProductDetailsError)

            XCTAssert(error == .unknown)
        }
    }
}
