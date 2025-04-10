//
//  ProductAttributesMapper.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

import MELIStoreCore

/// Mapper responsable de transformar una lista de objetos `ProductAttributeResponse`
/// en una lista de entidades del dominio `ProductAttributeEntity`.
///
/// Esta clase implementa `BaseResponseMapperProtocol` para aplicar una lógica común de mapeo seguro
/// y opcional, permitiendo manejar entradas nulas de forma controlada.
struct ProductAttributesMapper: BaseResponseMapperProtocol {
    
    /// Transforma una lista opcional de respuestas de atributos del producto en entidades del dominio.
    ///
    /// - Parameter input: Una lista opcional de `ProductAttributeResponse`, cada uno representando un atributo del producto
    ///   proveniente del backend.
    /// - Returns: Una lista de `ProductAttributeEntity` mapeada con los valores relevantes para el dominio.
    /// - Throws: Un error si el mapeo falla internamente o si los datos no cumplen con los requisitos esperados.
    func mapResponse(
        _ input: [ProductAttributeResponse]?
    ) throws -> [ProductAttributeEntity] {
        return mapOptionalList(input) { item in
            ProductAttributeEntity(
                id: item.id,
                name: item.name,
                valueID: item.valueID,
                valueName: item.valueName
            )
        }
    }
}
