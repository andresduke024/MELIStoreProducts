//
//  MockProductDetailsEntity.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 9/04/25.
//

@testable import MELIStoreProducts

struct MockProductDetailsEntity {
    static func build(
        id: String? = nil,
        name: String? = nil,
        shortDescription: String? = nil,
        pictures: [ProductPictureEntity]? = nil,
        mainFeatures: [String]? = nil
    ) -> ProductDetailsEntity? {
        ProductDetailsEntity(
            id: id,
            status: "",
            childrenIDs: [],
            domainId: "",
            permalink: "",
            name: name ?? "",
            familyName: "",
            type: "",
            pictures: pictures ?? [],
            mainFeatures: mainFeatures ?? [],
            attributes: [],
            shortDescription: shortDescription ?? ""
        )
    }
}
