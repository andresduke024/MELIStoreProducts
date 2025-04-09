//
//  ProductDetailsMapper.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 6/04/25.
//

import MELIStoreCore
import SwiftDependencyInjector

/// Mapper responsable de transformar tanto datos de entrada (`String`) en requests de dominio,
/// como respuestas remotas (`ProductDetailsResponse`) en entidades del dominio (`ProductDetailsEntity`).
///
/// Utiliza mappers inyectados para transformar atributos y fotos del producto de forma modular.
struct ProductDetailsMapper: BaseMapperProtocol {

    /// Mapper inyectado que transforma atributos del producto.
    @Inject
    private var attributesMapper: ProductAttributesMapper

    /// Mapper inyectado que transforma imágenes del producto.
    @Inject
    private var picturesMapper: ProductPicturesMapper

    /// Transforma un `String` (normalmente un ID de producto) en una entidad `ProductDetailsRequest`.
    ///
    /// - Parameter input: El identificador del producto.
    /// - Returns: Una entidad `ProductDetailsRequest` lista para ser enviada al backend.
    /// - Throws: No lanza errores en la implementación actual.
    func mapRequest(
        _ input: String
    ) throws -> ProductDetailsRequest {
        ProductDetailsRequest(id: input)
    }

    /// Transforma una respuesta `ProductDetailsResponse` proveniente del backend
    /// en una entidad del dominio `ProductDetailsEntity`.
    ///
    /// - Parameter input: Objeto de respuesta con los datos crudos del backend.
    /// - Returns: Entidad de dominio `ProductDetailsEntity` con los datos estructurados.
    /// - Throws: `ProductDetailsError.invalidData` si los datos no son válidos o están incompletos.
    func mapResponse(
        _ input: ProductDetailsResponse
    ) throws -> ProductDetailsEntity {
        let attributes = try attributesMapper.mapResponse(input.attributes)
        let pictures = try picturesMapper.mapResponse(input.pictures)
        let features = (input.mainFeatures ?? []).compactMap { $0.text }

        let details = ProductDetailsEntity(
            id: input.id,
            status: input.status ?? "",
            childrenIDs: input.childrenIDS ?? [],
            domainId: input.domainID,
            permalink: input.permalink ?? "",
            name: input.name,
            familyName: input.familyName,
            type: "",
            pictures: pictures,
            mainFeatures: features,
            attributes: attributes,
            shortDescription: input.shortDescription?.content ?? ""
        )
        
        guard let details else { throw ProductDetailsError.invalidData }
        
        return details
    }
}
