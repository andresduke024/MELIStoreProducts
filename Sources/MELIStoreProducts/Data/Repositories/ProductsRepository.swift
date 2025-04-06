//
//  ProductsRepository.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

import MELIStoreCore
import SwiftDependencyInjector

struct ProductsRepository: BaseRepositoryProtocol, ProductsRepositoryProtocol {

    @Inject
    private var productsSearchRemoteDataSource: ProductsSearchRemoteDataSourceProtocol
    
    @Inject
    private var productSearchMapper: ProductSearchMapper
    
    func search(_ entity: ProductsSearchEntity) async throws -> [PLPProductEntity] {
        return try await executeDataSource(
            mapper: productSearchMapper,
            data: entity,
            call: productsSearchRemoteDataSource.call
        )
    }
}
