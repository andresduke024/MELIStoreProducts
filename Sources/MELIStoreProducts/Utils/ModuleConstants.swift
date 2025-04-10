//
//  ModuleConstants.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

/// Contenedor de constantes utilizadas dentro del módulo de productos.
///
/// Esta estructura define valores estáticos relacionados con la configuración
/// de endpoints, parámetros por defecto de búsqueda y paginación.
struct ModuleConstants {
    /// Identificador base para las llamadas al API de productos.
    static let productsAPI = "products"
    
    /// Ruta del endpoint de búsqueda de productos.
    static let productSearchEndpoint = "search"
    
    /// Estado por defecto utilizado en las búsquedas de productos.
    static let defaultProductSearchStatus = "active"
    
    /// Identificador de sitio por defecto para búsquedas de productos.
    static let defaultProductSearchSiteId = "MCO"
    
    /// Cantidad de resultados por página en búsquedas de productos.
    static let defaultProductSearchLimit = 15
    
    /// Índice inicial utilizado en procesos de paginación.
    static let paginationStartIndex = 0
}
