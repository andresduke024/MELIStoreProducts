//
//  PaginationProperties.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

struct PaginationProperties: Identifiable {
    let id: String
    let interval: Int
    
    init(
        id: String,
        interval: Int = ModuleConstants.defaultProductSearchLimit
    ) {
        self.id = id
        self.interval = interval
    }
}
