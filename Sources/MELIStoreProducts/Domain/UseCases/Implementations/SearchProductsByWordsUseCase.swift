//
//  SearchProductsByWordsUseCase.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

import SwiftDependencyInjector

/// Implementación del caso de uso para buscar productos utilizando palabras clave.
///
/// Esta estructura coordina la ejecución de la búsqueda paginada de productos
/// usando el repositorio y un manejador de paginación inyectados. El caso de uso
/// se apoya en `PaginationManagerProtocol` para administrar la paginación basada en el `searchId`.
///
/// Conforma al protocolo `SearchProductsByWordsUseCaseProtocol`.
struct SearchProductsByWordsUseCase: SearchProductsByWordsUseCaseProtocol {

    /// Repositorio de productos encargado de realizar la búsqueda remota.
    @Inject
    private var repository: ProductsRepositoryProtocol

    /// Administrador de paginación que controla el avance y persistencia de los offsets.
    @Inject
    private var paginationManager: PaginationManagerProtocol

    /// Ejecuta la búsqueda paginada de productos a partir de una entidad con palabras clave.
    ///
    /// - Parameter data: Entidad `ProductsSearchEntity` con los términos de búsqueda y configuración de paginación.
    /// - Returns: Una lista de productos (`[ListProductEntity]`) que coinciden con la búsqueda.
    /// - Throws: Un error si ocurre un problema durante la búsqueda o la paginación.
    func invoke(data: ProductsSearchEntity) async throws -> [ListProductEntity] {
        let properties = PaginationProperties(id: data.searchId)

        return try await paginationManager.start(properties: properties) { newOffset in
            try await repository.search(data.copy(newOffset: newOffset))
        }
    }
}
