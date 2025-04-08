//
//  ProductPictureResponse.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

struct ProductPictureResponse: Codable {
    let id: String?
    let url: String?
    let suggestedForPicker: [String]?
    let maxWidth, maxHeight: Int?

    enum CodingKeys: String, CodingKey {
        case id, url
        case suggestedForPicker = "suggested_for_picker"
        case maxWidth = "max_width"
        case maxHeight = "max_height"
    }
}
