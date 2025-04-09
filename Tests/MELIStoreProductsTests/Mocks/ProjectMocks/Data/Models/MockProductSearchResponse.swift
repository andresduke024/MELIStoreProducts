//
//  MockProductSearchResponse.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 8/04/25.
//

@testable import MELIStoreProducts

struct MockProductSearchResponse {
    static func build(
        keywords: String? = nil
    ) -> ProductSearchResponse {
        ProductSearchResponse(
            keywords: keywords,
            paging: nil,
            results: [],
            usedAttributes: [],
            queryType: nil
        )
    }
}
