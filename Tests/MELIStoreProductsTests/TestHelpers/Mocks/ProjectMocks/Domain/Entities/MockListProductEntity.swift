//
//  MockListProductEntity.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 9/04/25.
//

@testable import MELIStoreProducts

struct MockListProductEntity {
    static func build(
        id: String? = nil,
        name: String? = nil,
        pictures: [ProductPictureEntity]? = nil,
    ) -> ListProductEntity? {
        ListProductEntity(
            id: id,
            name: name ?? "",
            attributes: [],
            pictures: pictures ?? []
        )
    }
}
