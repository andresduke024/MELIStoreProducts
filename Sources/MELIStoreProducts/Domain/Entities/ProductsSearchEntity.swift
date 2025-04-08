//
//  ProductsSearchEntity.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

struct ProductsSearchEntity {
    let searchId: String
    let words: String
    let nextOffset: Int

    init(
        searchId: String,
        words: String,
        nextOffset: Int = ModuleConstants.paginationStartIndex
    ) {
        self.searchId = searchId
        self.words = words
        self.nextOffset = nextOffset
    }

    func copy(
        newOffset: Int? = nil
    ) -> ProductsSearchEntity {
        return ProductsSearchEntity(
            searchId: searchId,
            words: words,
            nextOffset: newOffset ?? nextOffset
        )
    }
}
