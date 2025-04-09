//
//  ProductDetailsMapper.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 8/04/25.
//

import MELIStoreCore
import MELIStoreDesignSystem
import SwiftDependencyInjector

struct ProductDetailsUIMapper: UIMapper {
    
    @Inject
    private var attributesMapper: AttributesUIMapper
    
    func map(_ entity: ProductDetailsEntity) -> ProductDetailsUIModel {
        let attributes = attributesMapper.map(entity.attributes)
        
        return ProductDetailsUIModel(
            id: entity.id,
            description: entity.shortDescription,
            name: entity.name,
            pictures: pictures(entity),
            mainFeatures: features(entity),
            attributes: attributes
        )
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
