//
//  ProductsSearchRemoteDataSource.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

import Foundation
import MELIStoreCore
import SwiftDependencyInjector

/// Fuente de datos remota que implementa la búsqueda de productos utilizando un `HTTPManager`.
///
/// Esta implementación de `ProductsSearchRemoteDataSourceProtocol` realiza una solicitud HTTP GET
/// al endpoint de búsqueda definido por el módulo, pasando los parámetros de búsqueda y gestionando
/// posibles errores mediante un mapeo personalizado.
struct ProductsSearchRemoteDataSource: ProductsSearchRemoteDataSourceProtocol {
    
    /// Cliente HTTP inyectado que se encarga de ejecutar la solicitud remota.
    @Inject
    private var httpManager: HTTPManagerProtocol
    
    /// Ejecuta una búsqueda remota de productos según los parámetros dados.
    ///
    /// - Parameter params: Parámetros de búsqueda.
    /// - Returns: Una respuesta `ProductSearchResponse` con los productos encontrados.
    /// - Throws: Un error `ProductSearchError` si ocurre un fallo en la búsqueda, incluyendo
    ///   errores como recurso no encontrado o fallos genéricos.
    func call(_ params: ProductsSearchQueryParams) async throws -> ProductSearchResponse {
        return try await httpManager.get(
            endpoint: ModuleEndpoints.search,
            extraHeaders: nil,
            requiresAuthentication: true,
            queryParams: params,
            requestErrorMapper: { error in
                return switch error {
                    case .notFound: ProductSearchError.notFound
                    default: ProductSearchError.failInSearch
                }
            }
        )
    }
}
