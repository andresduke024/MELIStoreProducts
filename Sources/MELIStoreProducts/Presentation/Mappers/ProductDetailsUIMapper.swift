//
//  ProductDetailsMapper.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 8/04/25.
//

import MELIStoreCore
import MELIStoreDesignSystem
import SwiftDependencyInjector

/// Mapper responsable de transformar una entidad `ProductDetailsEntity`
/// (modelo de dominio) en un `ProductDetailsUIModel` (modelo para la vista de detalle).
///
/// Se encarga de mapear atributos, imágenes y características principales
/// para ser utilizadas en la UI.
struct ProductDetailsUIMapper: UIMapper {
    
    /// Mapper de atributos del producto para la UI.
    @Inject
    private var attributesMapper: AttributesUIMapper
    
    /// Transforma la entidad de dominio en su representación de UI.
    ///
    /// - Parameter entity: La entidad `ProductDetailsEntity` proveniente del dominio.
    /// - Returns: Un `ProductDetailsUIModel` para mostrar en la vista de detalle.
    func map(_ entity: ProductDetailsEntity) -> ProductDetailsUIModel {
        let attributes = attributesMapper.map(entity.attributes)
        
        return ProductDetailsUIModel(
            id: entity.id,
            description: entity.shortDescription,
            name: entity.name,
            pictures: pictures(entity),
            mainFeatures: features(entity),
            attributes: attributes
        )
    }
    
    /// Extrae y transforma las características principales del producto.
    private func features(
        _ entity: ProductDetailsEntity
    ) -> [AttributeUIModel] {
        entity.mainFeatures.map { feature in
            AttributeUIModel(
                id: feature,
                name: feature
            )
        }
    }
    
    /// Extrae las URLs de las imágenes del producto.
    private func pictures(
        _ entity: ProductDetailsEntity
    ) -> [String] {
        entity.pictures.map { picture in
            picture.url
        }
    }
}
