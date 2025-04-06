//
//  ProductPictureMapper.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

import MELIStoreCore

struct ProductPicturesMapper: BaseResponseMapperProtocol {
    func mapResponse(
        _ input: [PictureResponse]?
    ) throws -> [ProductPictureEntity] {
        return mapOptionalList(input) { item in
            ProductPictureEntity(
                id: item.id,
                url: item.url
            )
        }
    }
}
