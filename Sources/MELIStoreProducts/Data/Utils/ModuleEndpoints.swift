//
//  ModuleEndpoints.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

import MELIStoreCore

enum ModuleEndpoints: EndpointProtocol {
    case search
    
    var path: String {
        switch self {
            case .search: ModuleConstants.productSearchEndpoint
        }
    }
    
    var api: String {
        switch self {
            case .search: ModuleConstants.productsAPI
        }
    }
}
