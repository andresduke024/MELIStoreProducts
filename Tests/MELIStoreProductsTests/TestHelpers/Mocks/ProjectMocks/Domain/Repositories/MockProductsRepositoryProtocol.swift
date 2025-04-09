//
//  MockProductsRepositoryProtocol.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 9/04/25.
//

@testable import MELIStoreProducts

struct MockProductsRepositoryProtocol: ProductsRepositoryProtocol {
    
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
    
    private func resolve<T>(_ result: Result<T, Error>?) throws -> T {
        guard let result else { throw MockError.nilValue }
        
        switch result {
        case .success(let data):
            return data
        case .failure(let failure):
            throw failure
        }

    }
}
