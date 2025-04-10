//
//  MockProductSearchEntity.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 9/04/25.
//

@testable import MELIStoreProducts

struct MockProductSearchEntity {
    static func build(
        searchId: String? = nil,
        words: String? = nil,
        nextOffset: Int? = nil
    ) -> ProductsSearchEntity {
        ProductsSearchEntity(
            searchId: searchId ?? "",
            words: words ?? "",
            nextOffset: nextOffset ?? 0
        )
    }
}
