//
//  ProductPictureEntity.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

struct ProductPictureEntity {
    let id: String
    let url: String

    init?(
        id: String?,
        url: String?
    ) {
        guard let id, let url else { return nil }
        
        self.id = id
        self.url = url
    }
}
