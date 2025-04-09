//
//  ListProductUIMapper.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

import MELIStoreCore
import MELIStoreDesignSystem
import SwiftDependencyInjector

struct ListProductUIMapper: UIMapper {
    
    @Inject
    private var attributesMapper: AttributesUIMapper
    
    func map(
        _ entity: [ListProductEntity]
    ) -> [ListProductUIModel] {
        entity.map { item in
            let attributes = attributesMapper.map(item.attributes)
            
            return ListProductUIModel(
                id: item.id,
                name: item.name,
                image: item.pictures.first?.url ?? "",
                attributes: attributes
            )
        }
    }
}
