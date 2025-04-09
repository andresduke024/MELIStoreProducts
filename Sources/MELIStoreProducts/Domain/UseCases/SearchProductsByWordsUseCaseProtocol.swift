//
//  SearchProductsByWordsUseCaseProtocol.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 9/04/25.
//

/// Protocolo que define el caso de uso para buscar productos a partir de palabras clave.
///
/// Este contrato representa una acción de negocio que permite realizar una búsqueda
/// basada en una entidad con los términos y parámetros necesarios.
///
/// Conforma a `Sendable` para garantizar su seguridad en contextos concurrentes.
protocol SearchProductsByWordsUseCaseProtocol: Sendable {
    
    /// Ejecuta la búsqueda de productos utilizando los parámetros provistos.
    ///
    /// - Parameter data: Entidad `ProductsSearchEntity` que contiene las palabras clave y la paginación.
    /// - Returns: Una lista de entidades `ListProductEntity` que representan los productos encontrados.
    /// - Throws: Un error si ocurre un problema durante la búsqueda o el mapeo de datos.
    func invoke(data: ProductsSearchEntity) async throws -> [ListProductEntity]
}
