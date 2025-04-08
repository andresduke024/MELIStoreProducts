//
//  ProductSettingsResponse.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

struct ProductSettingsResponse: Codable {
    let listingStrategy: String?
    let exclusive: Bool?

    enum CodingKeys: String, CodingKey {
        case listingStrategy = "listing_strategy"
        case exclusive
    }
}
