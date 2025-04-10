//
//  ProductPickerItemResponse.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 7/04/25.
//

struct ProductPickerItemResponse: Codable {
    let productID, pickerLabel, pictureID: String?
    let thumbnail: String?
    let tags: [String]?
    let permalink: String?

    enum CodingKeys: String, CodingKey {
        case productID = "product_id"
        case pickerLabel = "picker_label"
        case pictureID = "picture_id"
        case thumbnail, tags, permalink
    }
}
