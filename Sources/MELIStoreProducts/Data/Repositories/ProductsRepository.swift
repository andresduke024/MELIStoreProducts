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
    private var productDetailsRemoteDataSource: ProductDetailsRemoteDataSourceProtocol
    
    @Inject
    private var productSearchMapper: ProductSearchMapper
    
    @Inject
    private var productDetailsMapper: ProductDetailsMapper
    
    func search(_ entity: ProductsSearchEntity) async throws -> [PLPProductEntity] {
        return try await executeDataSource(
            mapper: productSearchMapper,
            data: entity,
            call: productsSearchRemoteDataSource.call
        )
    }
    
    func get(_ id: String) async throws -> ProductDetailsEntity {
        return try await executeDataSource(
            mapper: productDetailsMapper,
            data: id,
            call: productDetailsRemoteDataSource.call
        )
    }
}
