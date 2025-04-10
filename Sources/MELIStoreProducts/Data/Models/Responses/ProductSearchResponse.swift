//
//  ProductSearchResponse.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

struct ProductSearchResponse: Codable {
    let keywords: String?
    let paging: PaginationResponse?
    let results: [ProductResponse]?
    let usedAttributes: [ProductAttributeResponse]?
    let queryType: String?

    enum CodingKeys: String, CodingKey {
        case keywords, paging, results
        case usedAttributes = "used_attributes"
        case queryType = "query_type"
    }
}
