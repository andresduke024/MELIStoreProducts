//
//  ModuleImages.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 7/04/25.
//

import Foundation
import MELIStoreDesignSystem

/// Enumeración de imágenes específicas del módulo de productos.
///
/// `ModuleImages` implementa el protocolo `ImageProtocol` y proporciona acceso
/// a imágenes que se encuentran dentro del bundle del módulo.
///
/// Estas imágenes son utilizadas principalmente por la capa de presentación.
enum ModuleImages: ImageProtocol {
    /// Imagen utilizada para la pantalla de presentación del módulo.
    case presentation
    
    /// Nombre de la imagen asociada al caso.
    ///
    /// Se utiliza para localizar el recurso gráfico dentro del bundle.
    var name: String {
        switch self {
        case .presentation:
            return "Presentation"
        }
    }
    
    /// Bundle donde se encuentra alojada la imagen.
    ///
    /// Retorna el bundle actual del módulo utilizando `.module`.
    var bundle: Bundle? { .module }
}
