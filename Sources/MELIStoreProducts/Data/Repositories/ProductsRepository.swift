//
//  ProductsRepository.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

import MELIStoreCore
import SwiftDependencyInjector

/// Repositorio que implementa la lógica de negocio relacionada con productos,
/// incluyendo búsquedas y obtención de detalles.
///
/// Esta clase actúa como intermediario entre los data sources remotos y el dominio,
/// utilizando mappers para transformar los datos de red en entidades de dominio.
struct ProductsRepository: BaseRepositoryProtocol, ProductsRepositoryProtocol {

    /// Data source remoto para búsquedas de productos.
    @Inject
    private var productsSearchRemoteDataSource: ProductsSearchRemoteDataSourceProtocol
    
    /// Data source remoto para obtener detalles de un producto.
    @Inject
    private var productDetailsRemoteDataSource: ProductDetailsRemoteDataSourceProtocol
    
    /// Mapper para transformar entidades de búsqueda y respuestas de productos.
    @Inject
    private var productSearchMapper: ProductSearchMapper
    
    /// Mapper para transformar respuestas detalladas en entidades de dominio.
    @Inject
    private var productDetailsMapper: ProductDetailsMapper
    
    /// Realiza una búsqueda de productos con base en una entidad de entrada.
    ///
    /// - Parameter entity: La entidad `ProductsSearchEntity` que contiene las palabras clave y el desplazamiento.
    /// - Returns: Lista de productos transformados en `ListProductEntity` para su uso en la UI.
    /// - Throws: Propaga errores de red, mapeo o validación desde el data source o los mappers.
    func search(_ entity: ProductsSearchEntity) async throws -> [ListProductEntity] {
        return try await executeDataSource(
            mapper: productSearchMapper,
            data: entity,
            call: productsSearchRemoteDataSource.call
        )
    }
    
    /// Obtiene los detalles completos de un producto dado su identificador.
    ///
    /// - Parameter id: El identificador único del producto.
    /// - Returns: Una entidad `ProductDetailsEntity` lista para ser usada por la capa de presentación.
    /// - Throws: Propaga errores de red o de transformación si la respuesta no es válida.
    func get(_ id: String) async throws -> ProductDetailsEntity {
        return try await executeDataSource(
            mapper: productDetailsMapper,
            data: id,
            call: productDetailsRemoteDataSource.call
        )
    }
}
