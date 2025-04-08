//
//  ProductAttributesMapper.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

import MELIStoreCore

struct ProductAttributesMapper: BaseResponseMapperProtocol {
    func mapResponse(
        _ input: [ProductAttributeResponse]?
    ) throws -> [ProductAttributeEntity] {
        return mapOptionalList(input) { item in
            ProductAttributeEntity(
                id: item.id,
                name: item.name,
                valueID: item.valueID,
                valueName: item.valueName
            )
        }
    }
}
