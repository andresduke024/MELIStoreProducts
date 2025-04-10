//
//  ProductSearchQueryParams.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

import MELIStoreCore

struct ProductsSearchQueryParams: QueryParamsModelProtocol {
    
    private let status: String
    private let siteId: String
    private let words: String
    private let limit: Int
    private let offset: Int
    
    init(
        status: String = ModuleConstants.defaultProductSearchStatus,
        siteId: String = ModuleConstants.defaultProductSearchSiteId,
        limit: Int = ModuleConstants.defaultProductSearchLimit,
        words: String,
        offset: Int
    ) {
        self.status = status
        self.siteId = siteId
        self.words = words
        self.limit = limit
        self.offset = offset
    }
    
    func transform() -> [String : Sendable] {
        return [
            "status": status,
            "site_id": siteId,
            "q": words,
            "limit": limit,
            "offset": offset
        ]
    }
}
