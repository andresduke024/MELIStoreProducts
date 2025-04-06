//
//  ProductSearchResultsResponse.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

struct ProductResponse: Codable {
    let id: String?
    let dateCreated: String?
    let catalogProductID: String?
    let status: String?
    let domainID: String?
    let settings: ProductSettingsResponse?
    let name: String?
    let attributes: [ProductAttributeResponse]?
    let pictures: [PictureResponse]?
    let childrenIDS: [String]?
    let qualityType: String?
    let priority: String?
    let type: String?
    let siteID: String?
    let variations: [String]?
    let keywords: String?
    let description: String?
    let parentID: String?

    enum CodingKeys: String, CodingKey {
        case id
        case dateCreated = "date_created"
        case catalogProductID = "catalog_product_id"
        case status
        case domainID = "domain_id"
        case settings, name
        case attributes, pictures
        case childrenIDS = "children_ids"
        case qualityType = "quality_type"
        case priority, type
        case siteID = "site_id"
        case variations, keywords, description
        case parentID = "parent_id"
    }
}
