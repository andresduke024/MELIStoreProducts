//
//  GetProductDetailsUseCase.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 6/04/25.
//

import SwiftDependencyInjector

struct GetProductDetailsUseCase: Sendable {
    
    @Inject
    private var repository: ProductsRepositoryProtocol
    
    func invoke(_ id: String) async throws -> ProductDetailsEntity {
        return try await repository.get(id)
    }
}
