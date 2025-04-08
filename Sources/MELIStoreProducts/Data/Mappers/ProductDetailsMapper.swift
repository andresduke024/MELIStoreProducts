//
//  ProductDetailsMapper.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 6/04/25.
//

import MELIStoreCore
import SwiftDependencyInjector

struct ProductDetailsMapper: BaseMapperProtocol {

    func mapRequest(
        _ input: String
    ) throws -> ProductDetailsRequest {
        ProductDetailsRequest(id: input)
    }

    func mapResponse(
        _ input: ProductDetailsResponse
    ) throws -> ProductDetailsEntity {
        ProductDetailsEntity()
    }
}
