//
//  ModuleRoutes.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 7/04/25.
//

import MELIStoreCore

enum ModuleRoutes: RouteProtocol {
    case plp(searchText: String)
    case pdp(id: String)
}
