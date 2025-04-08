//
//  ProductDetailsMapper.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 6/04/25.
//

import MELIStoreCore
import SwiftDependencyInjector

struct ProductDetailsMapper: BaseMapperProtocol {

    @Inject
    private var attributesMapper: ProductAttributesMapper

    @Inject
    private var picturesMapper: ProductPicturesMapper

    func mapRequest(
        _ input: String
    ) throws -> ProductDetailsRequest {
        ProductDetailsRequest(id: input)
    }

    func mapResponse(
        _ input: ProductDetailsResponse
    ) throws -> ProductDetailsEntity {
        let attributes = try attributesMapper.mapResponse(input.attributes)
        let pictures = try picturesMapper.mapResponse(input.pictures)
        let features = (input.mainFeatures ?? []).compactMap { $0.text }

        let details = ProductDetailsEntity(
            id: input.id,
            status: input.status ?? "",
            childrenIDs: input.childrenIDS ?? [],
            domainId: input.domainID,
            permalink: input.permalink ?? "",
            name: input.name,
            familyName: input.familyName,
            type: "",
            pictures: pictures,
            mainFeatures: features,
            attributes: attributes,
            shortDescription: input.shortDescription?.content ?? ""
        )
        
        guard let details else { throw ProductDetailsError.invalidData }
        
        return details
    }
}
