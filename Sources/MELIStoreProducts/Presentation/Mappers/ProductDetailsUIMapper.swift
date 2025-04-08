//
//  ProductDetailsMapper.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 8/04/25.
//

import MELIStoreCore
import MELIStoreDesignSystem

struct ProductDetailsUIMapper: UIMapper {
    func map(_ entity: ProductDetailsEntity) -> ProductDetailsUIModel {
        return ProductDetailsUIModel(
            id: entity.id,
            description: entity.shortDescription,
            name: entity.name,
            pictures: pictures(entity),
            mainFeatures: features(entity),
            attributes: attributes(entity)
        )
    }
    
    private func attributes(
        _ entity: ProductDetailsEntity
    ) -> [AttributeUIModel] {
        entity.attributes.map { attribute in
            AttributeUIModel(
                id: attribute.id,
                name: "\(attribute.name):",
                description: attribute.valueName
            )
        }
    }
    
    private func features(
        _ entity: ProductDetailsEntity
    ) -> [AttributeUIModel] {
        entity.mainFeatures.map { feature in
            AttributeUIModel(
                id: feature,
                name: feature
            )
        }
    }
    
    private func pictures(
        _ entity: ProductDetailsEntity
    ) -> [String] {
        entity.pictures.map { picture in
            picture.url
        }
    }
}
