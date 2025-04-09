//
//  AttributesUIMapper.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 9/04/25.
//

import MELIStoreCore
import MELIStoreDesignSystem

/// Mapper encargado de transformar una lista de `ProductAttributeEntity`
/// (modelo de dominio) en una lista de `AttributeUIModel` (modelo de UI).
///
/// Este mapper es útil para representar visualmente los atributos de un producto
/// en la interfaz de usuario, con formato de texto legible.
struct AttributesUIMapper: UIMapper {
    
    /// Mapea entidades de atributos del dominio al modelo de UI.
    ///
    /// - Parameter entity: Lista de entidades `ProductAttributeEntity` desde la capa de dominio.
    /// - Returns: Lista de modelos de presentación `AttributeUIModel`
    func map(
        _ entity: [ProductAttributeEntity]
    ) -> [AttributeUIModel] {
        entity.map { attribute in
            AttributeUIModel(
                id: attribute.id,
                name: "\(attribute.name):",
                description: attribute.valueName
            )
        }
    }
}
