//
//  ProductAttributeResponse.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

struct ProductAttributeResponse: Codable {
    let id: String?
    let name: String?
    let valueID: String?
    let valueName: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case valueID = "value_id"
        case valueName = "value_name"
    }
}
