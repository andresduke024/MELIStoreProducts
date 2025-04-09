//
//  ProductSearchMapper.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

import MELIStoreCore
import SwiftDependencyInjector

/// Mapper responsable de transformar entidades de búsqueda de productos a parámetros de consulta remota,
/// así como de convertir respuestas remotas en entidades del dominio para la vista de listado.
///
/// Utiliza mappers inyectados para procesar atributos e imágenes de los productos individualmente.
struct ProductSearchMapper: BaseMapperProtocol {

    /// Mapper inyectado para transformar atributos del producto.
    @Inject
    private var attributesMapper: ProductAttributesMapper
    
    /// Mapper inyectado para transformar imágenes del producto.
    @Inject
    private var picturesMapper: ProductPicturesMapper

    /// Transforma una entidad de dominio `ProductsSearchEntity` en parámetros de consulta remota `ProductsSearchQueryParams`.
    ///
    /// - Parameter input: Objeto del dominio que representa la búsqueda local con texto y desplazamiento.
    /// - Returns: Parámetros adecuados para ejecutar la búsqueda en el backend.
    /// - Throws: No lanza errores en la implementación actual.
    func mapRequest(
        _ input: ProductsSearchEntity
    ) throws -> ProductsSearchQueryParams {
        ProductsSearchQueryParams(
            words: input.words,
            offset: input.nextOffset
        )
    }

    /// Transforma una respuesta remota `ProductSearchResponse` en una lista de entidades de dominio `ListProductEntity`.
    ///
    /// - Parameter input: Objeto de respuesta que contiene los productos encontrados y sus atributos.
    /// - Returns: Lista de entidades `ListProductEntity` con la información necesaria para mostrar en la UI.
    /// - Throws: Propaga errores en caso de que falle el mapeo de atributos o imágenes.
    func mapResponse(
        _ input: ProductSearchResponse
    ) throws -> [ListProductEntity] {
        return try mapOptionalList(input.results) { item in
            let attributes = try attributesMapper.mapResponse(item.attributes)
            let pictures = try picturesMapper.mapResponse(item.pictures)
            
            return ListProductEntity(
                id: item.id,
                name: item.name,
                attributes: attributes,
                pictures: pictures
            )
        }
    }
}
