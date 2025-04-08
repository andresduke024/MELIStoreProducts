//
//  ProductDetailsRemoteDataSourceProtocol.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 6/04/25.
//


protocol ProductDetailsRemoteDataSourceProtocol: Sendable {
    func call(_ request: ProductDetailsRequest) async throws -> ProductDetailsResponse
}
