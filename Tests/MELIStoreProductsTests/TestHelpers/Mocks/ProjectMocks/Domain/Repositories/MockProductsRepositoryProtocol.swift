//
//  MockProductsRepositoryProtocol.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 9/04/25.
//

@testable import MELIStoreProducts

struct MockProductsRepositoryProtocol: ProductsRepositoryProtocol, Mock {
    
    private let searchResult: Result<[ListProductEntity], Error>?
    private let getResult: Result<ProductDetailsEntity, Error>?
    
    init(
        searchResult: Result<[ListProductEntity], Error>? = nil,
        getResult: Result<ProductDetailsEntity, Error>? = nil,
    ) {
        self.searchResult = searchResult
        self.getResult = getResult
    }
    
    func search(_ entity: ProductsSearchEntity) async throws -> [ListProductEntity] {
        return try resolve(searchResult)
    }
    
    func get(_ id: String) async throws -> ProductDetailsEntity {
        return try resolve(getResult)
    }
}
