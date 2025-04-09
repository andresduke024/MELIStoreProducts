//
//  GetProductDetailsUseCaseProtocol.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 9/04/25.
//

protocol GetProductDetailsUseCaseProtocol: Sendable {
    func invoke(_ id: String) async throws -> ProductDetailsEntity
}
