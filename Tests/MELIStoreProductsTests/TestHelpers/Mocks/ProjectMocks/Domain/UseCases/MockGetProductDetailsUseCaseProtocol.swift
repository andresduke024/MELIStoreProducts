//
//  MockGetProductDetailsUseCase.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 9/04/25.
//

@testable import MELIStoreProducts

struct MockGetProductDetailsUseCaseProtocol: GetProductDetailsUseCaseProtocol, Mock {
    var result: Result<ProductDetailsEntity, Error>?
    
    init(
        result: Result<ProductDetailsEntity, Error>? = nil
    ) {
        self.result = result
    }
    
    func invoke(_ id: String) async throws -> ProductDetailsEntity {
        try resolve(result)
    }
}
