//
//  MockListProductEntity.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 9/04/25.
//

@testable import MELIStoreProducts

struct MockListProductEntity {
    static func build(
        id: String? = nil
    ) -> ListProductEntity? {
        ListProductEntity(
            id: id,
            name: "",
            attributes: [],
            pictures: []
        )
    }
}
