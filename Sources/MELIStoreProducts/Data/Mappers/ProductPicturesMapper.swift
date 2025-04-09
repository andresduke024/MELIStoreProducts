//
//  ProductPictureMapper.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

import MELIStoreCore

/// Mapper responsable de transformar una lista de objetos `ProductPictureResponse`
/// en una lista de entidades de dominio `ProductPictureEntity`.
///
/// Implementa `BaseResponseMapperProtocol` para aplicar una lógica común de mapeo seguro con manejo de valores opcionales.
struct ProductPicturesMapper: BaseResponseMapperProtocol {
    
    /// Transforma una lista opcional de respuestas de imágenes del producto en entidades del dominio.
    ///
    /// - Parameter input: Lista opcional de objetos `ProductPictureResponse` provenientes del backend.
    /// - Returns: Lista de `ProductPictureEntity` con identificador y URL de la imagen.
    /// - Throws: Error si ocurre un fallo interno durante el mapeo.
    func mapResponse(
        _ input: [ProductPictureResponse]?
    ) throws -> [ProductPictureEntity] {
        return mapOptionalList(input) { item in
            ProductPictureEntity(
                id: item.id,
                url: item.url
            )
        }
    }
}
