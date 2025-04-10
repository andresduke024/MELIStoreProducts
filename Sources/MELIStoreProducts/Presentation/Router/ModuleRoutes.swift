//
//  ModuleRoutes.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 7/04/25.
//

import MELIStoreCore

/// Enum que define las rutas internas del módulo de productos.
///
/// Conforma al protocolo `RouteProtocol`, lo cual permite que sea utilizado
/// por el sistema de navegación de la aplicación.
enum ModuleRoutes: RouteProtocol {
    /// Ruta hacia la pantalla de resultados de búsqueda de productos (PLP).
    ///
    /// - Parameter searchText: El texto de búsqueda ingresado por el usuario.
    case plp(searchText: String)
    
    /// Ruta hacia la pantalla de detalle de producto (PDP).
    ///
    /// - Parameter id: El identificador del producto a mostrar.
    case pdp(id: String)
}
