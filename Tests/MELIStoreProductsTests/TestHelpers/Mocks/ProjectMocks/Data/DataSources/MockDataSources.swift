//
//  MockDataSources.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 8/04/25.
//

@testable import MELIStoreProducts

final class MockProductsSearchRemoteDataSource: ProductsSearchRemoteDataSourceProtocol {
    func call(_ params: ProductsSearchQueryParams) async throws -> ProductSearchResponse {
        return MockProductSearchResponse.build()
    }
}

final class MockProductDetailsRemoteDataSource: ProductDetailsRemoteDataSourceProtocol {
    func call(_ request: ProductDetailsRequest) async throws -> ProductDetailsResponse {
        return MockProductDetailsResponse.build(
            id: "mock_id",
            name: "mock_name"
        )
    }
}
