//
//  PLPProductMapper.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

struct PLPProductsMapper {
    func map(
        _ input: [PLPProductEntity]
    ) -> [PLPProductUIModel] {
        input.map { item in
            PLPProductUIModel(
                id: item.id,
                name: item.name
            )
        }
    }
}
