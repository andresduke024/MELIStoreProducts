//
//  ListProductUIMapper.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

import MELIStoreCore
import MELIStoreDesignSystem
import SwiftDependencyInjector

/// Mapper responsable de transformar una lista de entidades `ListProductEntity`
/// (modelo de dominio) en una lista de `ListProductUIModel` (modelo para la vista).
///
/// Este mapper se utiliza en pantallas tipo PLP (Product Listing Page), donde se
/// muestran productos en formato de lista con sus atributos resumidos.
struct ListProductUIMapper: UIMapper {
    
    /// Mapper de atributos del producto para la vista.
    @Inject
    private var attributesMapper: AttributesUIMapper
    
    /// Mapea una lista de entidades del dominio a modelos de UI.
    ///
    /// - Parameter entity: Lista de `ListProductEntity` desde la capa de dominio.
    /// - Returns: Lista de `ListProductUIModel` para renderizar en la UI.
    func map(
        _ entity: [ListProductEntity]
    ) -> [ListProductUIModel] {
        entity.map { item in
            let attributes = attributesMapper.map(item.attributes)
            
            return ListProductUIModel(
                id: item.id,
                name: item.name,
                image: item.pictures.first?.url ?? "",
                attributes: attributes
            )
        }
    }
}
