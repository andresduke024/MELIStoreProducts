//
//  GetProductDetailsUseCase.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 6/04/25.
//

import SwiftDependencyInjector

/// Implementación del caso de uso para obtener los detalles de un producto.
///
/// Esta estructura orquesta la recuperación de la información detallada de un producto
/// a través del repositorio de productos inyectado. Su principal responsabilidad es
/// delegar el trabajo al repositorio y propagar el resultado.
///
/// Conforma al protocolo `GetProductDetailsUseCaseProtocol`.
struct GetProductDetailsUseCase: GetProductDetailsUseCaseProtocol {
    
    /// Repositorio de productos utilizado para acceder a los datos del producto.
    @Inject
    private var repository: ProductsRepositoryProtocol
    
    /// Ejecuta la lógica para obtener los detalles de un producto.
    ///
    /// - Parameter id: Identificador único del producto.
    /// - Returns: Entidad `ProductDetailsEntity` con la información del producto.
    /// - Throws: Un error si no se puede recuperar la información desde el repositorio.
    func invoke(_ id: String) async throws -> ProductDetailsEntity {
        return try await repository.get(id)
    }
}
