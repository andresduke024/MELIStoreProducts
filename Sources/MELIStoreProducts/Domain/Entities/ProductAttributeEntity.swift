//
//  ProductAttributeEntiity.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

struct ProductAttributeEntity {
    let id: String
    let name: String
    let valueID: String
    let valueName: String
    
    init?(
        id: String?,
        name: String?,
        valueID: String?,
        valueName: String?
    ) {
        guard let id, let name, let valueID, let valueName else { return nil }
        
        self.id = id
        self.name = name
        self.valueID = valueID
        self.valueName = valueName
    }
}
