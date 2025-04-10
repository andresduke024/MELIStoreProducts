//
//  GetProductDetailsUseCaseProtocol.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 9/04/25.
//

/// Protocolo que define el caso de uso para obtener los detalles de un producto.
///
/// Este contrato es implementado por una clase o struct que se encarga de orquestar
/// la lógica de negocio necesaria para recuperar un `ProductDetailsEntity`,
/// utilizando el repositorio correspondiente.
///
/// Conforma a `Sendable` para ser seguro en entornos concurrentes.
protocol GetProductDetailsUseCaseProtocol: Sendable {
    
    /// Ejecuta el caso de uso para obtener los detalles de un producto.
    ///
    /// - Parameter id: Identificador único del producto.
    /// - Returns: Una instancia de `ProductDetailsEntity` con la información del producto.
    /// - Throws: Un error si ocurre un problema al obtener o mapear los datos.
    func invoke(_ id: String) async throws -> ProductDetailsEntity
}
