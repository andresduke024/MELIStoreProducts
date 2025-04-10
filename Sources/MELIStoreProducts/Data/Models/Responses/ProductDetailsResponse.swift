//
//  ProductDetailsResponse.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 6/04/25.
//

struct ProductDetailsResponse: Codable {
    let id: String?
    let status: String?
    let domainID: String?
    let permalink: String?
    let name: String?
    let familyName: String?
    let pickers: [ProductPickerResponse]?
    let pictures: [ProductPictureResponse]?
    let mainFeatures: [ProductMainFeatureResponse]?
    let attributes: [ProductAttributeResponse]?
    let shortDescription: ProductShortDescriptionResponse?
    let parentID: String?
    let childrenIDS: [String]?
    let settings: ProductSettingsResponse?
    let buyBoxActivationDate: String?
    let dateCreated: String?

    enum CodingKeys: String, CodingKey {
        case id, status
        case domainID = "domain_id"
        case permalink, name
        case familyName = "family_name"
        case pickers, pictures
        case mainFeatures = "main_features"
        case attributes
        case shortDescription = "short_description"
        case parentID = "parent_id"
        case childrenIDS = "children_ids"
        case settings
        case buyBoxActivationDate = "buy_box_activation_date"
        case dateCreated = "date_created"
    }
}
