//
//  ProductsModule.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 8/04/25.
//

import SwiftUI
import MELIStoreCore

/// Punto de entrada del módulo de productos de la aplicación.
///
/// `ProductsModule` define el contenedor de dependencias y el punto inicial de navegación para el módulo.
/// Este módulo sigue el protocolo `ModuleProtocol` y se registra como módulo compartido.
public struct ProductsModule: ModuleProtocol {
    
    /// Instancia compartida del módulo, utilizada para acceder a su funcionalidad desde otros módulos.
    public static let shared = ProductsModule()
    
    /// Inicializador privado para restringir la creación de múltiples instancias del módulo.
    private init() {}
    
    /// Contenedor de dependencias específico para el módulo de productos.
    ///
    /// Implementa `DependenciesContainer` y registra las clases necesarias como datasources, repositorios, casos de uso, etc.
    public var dependenciesContainer: any DependenciesContainer {
        ModuleDependenciesContainer()
    }
    
    /// Punto de entrada visual para el módulo de productos.
   ///
   /// Retorna la ruta de navegación inicial (`ProductsModuleRoute`) para ser presentada desde la capa superior de navegación.
    @MainActor
    public var entryPoint: ProductsModuleRoute {
        ProductsModuleRoute()
    }
}

