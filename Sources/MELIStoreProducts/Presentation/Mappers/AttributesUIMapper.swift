//
//  AttributesUIMapper.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 9/04/25.
//

import MELIStoreCore
import MELIStoreDesignSystem

struct AttributesUIMapper: UIMapper {
    func map(
        _ entity: [ProductAttributeEntity]
    ) -> [AttributeUIModel] {
        entity.map { attribute in
            AttributeUIModel(
                id: attribute.id,
                name: "\(attribute.name):",
                description: attribute.valueName
            )
        }
    }
}
