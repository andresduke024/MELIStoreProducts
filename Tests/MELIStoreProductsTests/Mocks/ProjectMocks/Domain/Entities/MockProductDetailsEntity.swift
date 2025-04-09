//
//  MockProductDetailsEntity.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 9/04/25.
//

@testable import MELIStoreProducts

struct MockProductDetailsEntity {
    static func build(
        id: String? = nil
    ) -> ProductDetailsEntity? {
        ProductDetailsEntity(
            id: id,
            status: "",
            childrenIDs: [],
            domainId: "",
            permalink: "",
            name: "",
            familyName: "",
            type: "",
            pictures: [],
            mainFeatures: [],
            attributes: [],
            shortDescription: ""
        )
    }
}
