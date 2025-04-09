//
//  GetProductDetailsUseCaseTests.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 9/04/25.
//

import XCTest

@testable import MELIStoreProducts
@testable import SwiftDependencyInjector

final class GetProductDetailsUseCaseTests: XCTestCase {

    private var injector: Injector!

    override func setUpWithError() throws {
        injector = Injector.build(
            context: .tests(name: "GetProductDetailsUseCase")
        )
    }

    override func tearDownWithError() throws {
        injector = nil
    }

    private var id: String { "12345678" }

    private func buildSUT(
        _ mockProductsRepository: MockProductsRepositoryProtocol
    ) -> GetProductDetailsUseCase {
        injector.register(ProductsRepositoryProtocol.self) {
            mockProductsRepository
        }

        return GetProductDetailsUseCase()
    }

    func testSuccessResult() async throws {
        // Arrange
        let entity = try XCTUnwrap(
            MockProductDetailsEntity.build(id: id)
        )

        let mockResult: Result<ProductDetailsEntity, Error> = .success(entity)

        let sut = buildSUT(
            MockProductsRepositoryProtocol(getResult: mockResult)
        )

        // Act
        let result = try await sut.invoke(id)

        // Assert
        XCTAssert(result.id == id)
    }

    func testFailureResult() async throws {
        // Arrange
        let mockResult: Result<ProductDetailsEntity, Error> = .failure(
            ProductDetailsError.invalidData
        )

        let sut = buildSUT(
            MockProductsRepositoryProtocol(getResult: mockResult)
        )

        // Act / Assert
        await assertThrowsAsyncError(try await sut.invoke(id)) { error in
            let error = try! XCTUnwrap(error as? ProductDetailsError)

            XCTAssert(error == .invalidData)
        }
    }
}
