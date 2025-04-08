//
//  ProductDetailsRemoteDataSource.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 6/04/25.
//

import MELIStoreCore
import SwiftDependencyInjector

struct ProductDetailsRemoteDataSource: ProductDetailsRemoteDataSourceProtocol {
    @Inject
    private var httpManager: HTTPManagerProtocol
    
    func call(_ request: ProductDetailsRequest) async throws -> ProductDetailsResponse {
        return try await httpManager.get(
            endpoint: ModuleEndpoints.details(id: request.id),
            requiresAuthentication: true,
            queryParams: nil,
            requestErrorMapper: { error in
                return switch error {
                case .notFound: ProductDetailsError.invalidData
                default: ProductDetailsError.unknown
                }
            }
        )
    }
}
