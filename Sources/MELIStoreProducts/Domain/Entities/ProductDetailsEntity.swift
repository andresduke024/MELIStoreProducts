//
//  ProductDetailsEntity.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 6/04/25.
//

struct ProductDetailsEntity: Identifiable {
    let id: String
    let status: String
    let childrenIDs: [String]
    let domainId: String
    let permalink: String
    let name: String
    let familyName: String
    let type: String
    let pictures: [ProductPictureEntity]
    let mainFeatures: [String]
    let attributes: [ProductAttributeEntity]
    let shortDescription: String

    init?(
        id: String?,
        status: String,
        childrenIDs: [String],
        domainId: String?,
        permalink: String,
        name: String?,
        familyName: String?,
        type: String,
        pictures: [ProductPictureEntity]?,
        mainFeatures: [String],
        attributes: [ProductAttributeEntity],
        shortDescription: String
    ) {
        guard let id,
              let domainId,
              let name,
              let familyName,
              let pictures
        else { return nil }
        
        self.id = id
        self.status = status
        self.childrenIDs = childrenIDs
        self.domainId = domainId
        self.permalink = permalink
        self.name = name
        self.familyName = familyName
        self.type = type
        self.pictures = pictures
        self.mainFeatures = mainFeatures
        self.attributes = attributes
        self.shortDescription = shortDescription
    }
}
