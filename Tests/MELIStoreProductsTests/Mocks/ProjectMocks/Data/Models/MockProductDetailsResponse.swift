//
//  MockProductDetailsResponse.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 8/04/25.
//

@testable import MELIStoreProducts

struct MockProductDetailsResponse {
    static func build(
        id: String? = nil
    ) -> ProductDetailsResponse {
        ProductDetailsResponse(
            id: id,
            status: "",
            domainID: "",
            permalink: "",
            name: "",
            familyName: "",
            pickers: [],
            pictures: [],
            mainFeatures: [],
            attributes: [],
            shortDescription: nil,
            parentID: "",
            childrenIDS: [],
            settings: nil,
            buyBoxActivationDate: "",
            dateCreated: ""
        )
    }
}
