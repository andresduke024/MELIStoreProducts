//
//  ModuleEndpoints.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

import MELIStoreCore

/// Enum que define los endpoints específicos del módulo de productos de MELIStore.
///
/// Implementa `EndpointProtocol` para proporcionar los `path` y `api` necesarios en cada caso.
/// Es utilizado por el `HTTPManager` para construir correctamente las rutas al consumir servicios de red.
enum ModuleEndpoints: EndpointProtocol {
    /// Endpoint para realizar búsquedas de productos.
    case search
    
    /// Endpoint para obtener detalles de un producto específico.
    /// - Parameter id: Identificador único del producto.
    case details(id: String)
    
    /// Ruta específica del endpoint dentro del API.
   ///
   /// - Returns: `String` que representa el path final del endpoint.
   /// - Ejemplo: `/PRODUCT_ID` para detalles o una constante predefinida para búsqueda.
    var path: String {
        switch self {
            case .search: ModuleConstants.productSearchEndpoint
            case .details(id: let id): "\(CoreConstants.pathSeparator)\(id)"
        }
    }
    
    /// Identificador de la API asociada al endpoint.
    ///
    /// - Returns: Nombre o ruta base del API para el recurso.
    /// - En ambos casos (`search` y `details`) se usa la API de productos.
    var api: String {
        switch self {
            case .search: ModuleConstants.productsAPI
            case .details: ModuleConstants.productsAPI
        }
    }
}
