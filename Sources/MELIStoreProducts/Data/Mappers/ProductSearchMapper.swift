//
//  ProductSearchMapper.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

import MELIStoreCore
import SwiftDependencyInjector

struct ProductSearchMapper: BaseMapperProtocol {

    @Inject
    private var attributesMapper: ProductAttributesMapper
    
    @Inject
    private var picturesMapper: ProductPicturesMapper

    func mapRequest(
        _ input: ProductsSearchEntity
    ) throws -> ProductsSearchQueryParams {
        ProductsSearchQueryParams(
            words: input.words,
            offset: input.nextOffset
        )
    }

    func mapResponse(
        _ input: ProductSearchResponse
    ) throws -> [ListProductEntity] {
        return try mapOptionalList(input.results) { item in
            let attributes = try attributesMapper.mapResponse(item.attributes)
            let pictures = try picturesMapper.mapResponse(item.pictures)
            
            return ListProductEntity(
                id: item.id,
                name: item.name,
                attributes: attributes,
                pictures: pictures
            )
        }
    }
}
