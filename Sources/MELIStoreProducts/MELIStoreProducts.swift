//
//  ProductsModule.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 8/04/25.
//

import SwiftUI
import MELIStoreCore

public struct ProductsModule: ModuleProtocol {
    
    public static let shared = ProductsModule()
    
    private init() {}
    
    public var dependenciesContainer: any DependenciesContainer {
        ModuleDependenciesContainer()
    }
    
    @MainActor
    public var entryPoint: ProductsModuleRoute {
        ProductsModuleRoute()
    }
}

