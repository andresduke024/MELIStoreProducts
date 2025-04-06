//
//  ProductsSearchResultEntity.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

struct PLPProductEntity {
    let id: String
    let name: String
    let attributes: [ProductAttributeEntity]
    let pictures: [ProductPictureEntity]

    init?(
        id: String?,
        name: String?,
        attributes: [ProductAttributeEntity],
        pictures: [ProductPictureEntity]
    ) {
        guard let id, let name else { return nil }

        self.id = id
        self.name = name
        self.attributes = attributes
        self.pictures = pictures
    }
}
