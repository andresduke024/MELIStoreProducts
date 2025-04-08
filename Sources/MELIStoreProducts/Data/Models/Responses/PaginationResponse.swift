//
//  PaginationResponse.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

struct PaginationResponse: Codable {
    let total: Int?
    let limit: Int?
    let offset: Int?
}
