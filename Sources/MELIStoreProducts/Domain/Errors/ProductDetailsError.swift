//
//  ProductDetailsError.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 8/04/25.
//

/// Enum que representa los errores posibles durante la obtención de los detalles de un producto.
///
/// Conforma al protocolo `Error`, lo que permite usarlo en flujos asincrónicos con manejo de errores.
enum ProductDetailsError : Error {
    
    /// Indica que los datos recibidos son inválidos o faltan campos requeridos para construir la entidad del dominio.
    case invalidData
    
    /// Representa un error no identificado durante la operación.
    case unknown
}
