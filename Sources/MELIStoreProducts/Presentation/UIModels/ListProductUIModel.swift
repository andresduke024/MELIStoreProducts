//
//  ListProductUIModel.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

import MELIStoreDesignSystem

struct ListProductUIModel: Identifiable {
    let id: String
    let name: String
    let image: String
    let attributes: [AttributeUIModel]
}
