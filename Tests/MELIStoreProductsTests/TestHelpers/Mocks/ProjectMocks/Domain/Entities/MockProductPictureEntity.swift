//
//  MockProductPictureEntity.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 9/04/25.
//

@testable import MELIStoreProducts

struct MockProductPictureEntity {
    static func build(
        id: String?,
        url: String?
    ) -> ProductPictureEntity? {
        ProductPictureEntity(
            id: id,
            url: url
        )
    }
}
