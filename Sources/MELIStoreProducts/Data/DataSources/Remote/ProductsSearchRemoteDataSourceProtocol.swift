//
//  ProductsSearchRemoteDataSourceProtocol.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

protocol ProductsSearchRemoteDataSourceProtocol: Sendable {
    func call(_ params: ProductsSearchQueryParams) async throws -> ProductSearchResponse
}
