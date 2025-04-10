//
//  ProductDetailsRemoteDataSource.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 6/04/25.
//

import MELIStoreCore
import SwiftDependencyInjector

/// Fuente de datos remota que obtiene los detalles de un producto utilizando un `HTTPManager`.
///
/// Esta implementación de `ProductDetailsRemoteDataSourceProtocol` realiza una solicitud HTTP GET
/// al endpoint de detalles de producto, usando el `id` provisto en la solicitud, y maneja errores
/// específicos del dominio.
struct ProductDetailsRemoteDataSource: ProductDetailsRemoteDataSourceProtocol {
    
    /// Cliente HTTP inyectado que se encarga de realizar la solicitud remota.
    @Inject
    private var httpManager: HTTPManagerProtocol
    
    /// Obtiene los detalles de un producto remoto a partir del `id` incluido en el request.
    ///
    /// - Parameter request: Un objeto `ProductDetailsRequest` que contiene el `id` del producto a consultar.
    /// - Returns: Una respuesta `ProductDetailsResponse` con los datos completos del producto.
    /// - Throws: Un error `ProductDetailsError`, ya sea `.invalidData` si el producto no existe o `.unknown` en otros fallos.
    func call(_ request: ProductDetailsRequest) async throws -> ProductDetailsResponse {
        return try await httpManager.get(
            endpoint: ModuleEndpoints.details(id: request.id),
            extraHeaders: nil,
            requiresAuthentication: true,
            queryParams: nil,
            requestErrorMapper: { error in
                return switch error {
                case .notFound: ProductDetailsError.invalidData
                default: ProductDetailsError.unknown
                }
            }
        )
    }
}
