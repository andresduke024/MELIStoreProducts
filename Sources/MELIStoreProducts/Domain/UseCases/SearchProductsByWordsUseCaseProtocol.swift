//
//  SearchProductsByWordsUseCaseProtocol.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 9/04/25.
//

protocol SearchProductsByWordsUseCaseProtocol: Sendable {
    func invoke(data: ProductsSearchEntity) async throws -> [ListProductEntity]
}
