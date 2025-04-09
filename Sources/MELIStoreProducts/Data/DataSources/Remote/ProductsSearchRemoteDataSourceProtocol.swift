//
//  ProductsSearchRemoteDataSourceProtocol.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

/// Protocolo que define una fuente de datos remota para buscar productos.
///
/// Este protocolo permite realizar búsquedas en el catálogo de productos mediante
/// una consulta con parámetros definidos por el usuario. Es `Sendable` para su uso
/// seguro en contextos concurrentes.
protocol ProductsSearchRemoteDataSourceProtocol: Sendable {
    
    /// Realiza una búsqueda remota de productos según los parámetros proporcionados.
    ///
    /// - Parameter params: Un objeto `ProductsSearchQueryParams` que contiene los filtros de búsqueda,
    ///   como palabra clave, categoría, filtros aplicados, etc.
    /// - Returns: Un objeto `ProductSearchResponse` que incluye los resultados de la búsqueda, como
    ///   una lista de productos y metainformación relacionada.
    /// - Throws: Un error de tipo `ProductSearchError` si la operación falla, por ejemplo por problemas de red o una respuesta inválida del backend.
    func call(_ params: ProductsSearchQueryParams) async throws -> ProductSearchResponse
}
