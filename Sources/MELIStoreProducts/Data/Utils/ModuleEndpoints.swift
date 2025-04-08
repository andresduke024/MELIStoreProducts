//
//  ModuleEndpoints.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

import MELIStoreCore

enum ModuleEndpoints: EndpointProtocol {
    case search
    case details(id: String)
    
    var path: String {
        switch self {
            case .search: ModuleConstants.productSearchEndpoint
            case .details(id: let id): "/\(id)"
        }
    }
    
    var api: String {
        switch self {
            case .search: ModuleConstants.productsAPI
            case .details: ModuleConstants.productsAPI
        }
    }
}
