//
//  MockProductResponse.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 9/04/25.
//

@testable import MELIStoreProducts

struct MockProductResponse {
    static func build(
        id: String? = nil,
        name: String? = nil,
        attributes: [ProductAttributeResponse]? = nil,
        pictures: [ProductPictureResponse]? = nil
    ) -> ProductResponse {
        ProductResponse(
            id: id,
            dateCreated: "",
            catalogProductID: "",
            status: "",
            domainID: "",
            settings: nil,
            name: name,
            attributes: attributes,
            pictures: pictures,
            childrenIDS: [],
            qualityType: "",
            priority: "",
            type: "",
            siteID: "",
            variations: [],
            keywords: "",
            description: "",
            parentID: ""
        )
    }
}
