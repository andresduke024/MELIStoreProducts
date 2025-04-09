//
//  ProductDetailsUIModel.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 8/04/25.
//

import MELIStoreDesignSystem

struct ProductDetailsUIModel: Identifiable, Sendable {
    let id: String
    let description: String
    let name: String
    let pictures: [String]
    let mainFeatures: [AttributeUIModel]
    let attributes: [AttributeUIModel]
}
