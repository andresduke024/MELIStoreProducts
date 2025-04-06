//
//  ProductsRepositoryProtocol.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

protocol ProductsRepositoryProtocol: Sendable {
    func search(_ entity: ProductsSearchEntity) async throws -> [PLPProductEntity]
}
