//
//  SearchProductsByWordsUseCase.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

import SwiftDependencyInjector

struct SearchProductsByWordsUseCase: Sendable {

    @Inject
    private var repository: ProductsRepositoryProtocol

    @Inject
    private var paginationManager: PaginationManagerProtocol

    func invoke(data: ProductsSearchEntity) async throws -> [ListProductEntity] {
        let properties = PaginationProperties(id: data.searchId)

        return try await paginationManager.start(properties: properties) { newOffset in
            try await repository.search(data.copy(newOffset: newOffset))
        }
    }
}
