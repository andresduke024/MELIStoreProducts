//
//  ProductsSearchRemoteDataSource.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

import Foundation
import MELIStoreCore
import SwiftDependencyInjector

struct ProductsSearchRemoteDataSource: ProductsSearchRemoteDataSourceProtocol {
    
    @Inject
    private var httpManager: HTTPManagerProtocol
    
    func call(_ params: ProductsSearchQueryParams) async throws -> ProductSearchResponse {
        return try await httpManager.get(
            endpoint: ModuleEndpoints.search,
            requiresAuthentication: true,
            queryParams: params
        )
    }
}
