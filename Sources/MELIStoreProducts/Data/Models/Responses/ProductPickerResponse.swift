//
//  ProductPickerResponse.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 7/04/25.
//

struct ProductPickerResponse: Codable {
    let pickerID: String?
    let pickerName: String?
    let products: [ProductPickerItemResponse]?

    enum CodingKeys: String, CodingKey {
        case pickerID = "picker_id"
        case pickerName = "picker_name"
        case products
    }
}
