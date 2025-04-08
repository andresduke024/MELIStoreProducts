//
//  PLPProductMapper.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

import MELIStoreCore

struct PLPProductsUIMapper: UIMapper {
    func map(
        _ entity: [PLPProductEntity]
    ) -> [PLPProductUIModel] {
        entity.map { item in
            PLPProductUIModel(
                id: item.id,
                name: item.name,
                image: item.pictures.first?.url ?? ""
            )
        }
    }
}
