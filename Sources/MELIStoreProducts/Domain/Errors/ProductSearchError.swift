//
//  ProductSearchError.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 7/04/25.
//

/// Enum que representa los errores posibles durante la búsqueda de productos.
///
/// Este error se utiliza para comunicar fallos específicos en el proceso de búsqueda,
/// ya sea por problemas con la respuesta del backend o situaciones no previstas.
///
/// Conforma al protocolo `Error`, lo que permite su uso en flujos asincrónicos y control de errores.
enum ProductSearchError: Error {
    /// Indica que no se encontraron resultados para la búsqueda realizada.
    case notFound
    
    /// Error general que representa una falla durante el proceso de búsqueda.
    case failInSearch
    
    /// Representa un error desconocido o no manejado explícitamente.
    case unknown
}
