//
//  ProductsRepositoryProtocol.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

/// Protocolo que define las operaciones del repositorio de productos.
///
/// Expone métodos para buscar productos y obtener sus detalles, encapsulando la lógica de acceso a datos.
/// Es implementado por `ProductsRepository` y puede ser fácilmente mockeado para pruebas.
///
/// Conforma a `Sendable` para permitir su uso seguro en contextos concurrentes.
protocol ProductsRepositoryProtocol: Sendable {
    
    /// Realiza una búsqueda de productos a partir de una entidad de entrada.
    ///
    /// - Parameter entity: Entidad `ProductsSearchEntity` que contiene los parámetros de búsqueda.
    /// - Returns: Una lista de entidades `ListProductEntity` correspondientes a los resultados.
    /// - Throws: Un error de tipo `ProductSearchError` si la operación falla.
    func search(_ entity: ProductsSearchEntity) async throws -> [ListProductEntity]
    
    /// Obtiene los detalles completos de un producto a partir de su identificador.
    ///
    /// - Parameter id: Identificador único del producto.
    /// - Returns: Una entidad `ProductDetailsEntity` con toda la información relevante del producto.
    /// - Throws: Un error de tipo `ProductDetailsError` si no se puede obtener o mapear la información.
    func get(_ id: String) async throws -> ProductDetailsEntity
}
