//
//  ListProductUIMapper.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

import MELIStoreCore

struct ListProductUIMapper: UIMapper {
    func map(
        _ entity: [ListProductEntity]
    ) -> [ListProductUIModel] {
        entity.map { item in
            ListProductUIModel(
                id: item.id,
                name: item.name,
                image: item.pictures.first?.url ?? ""
            )
        }
    }
}
