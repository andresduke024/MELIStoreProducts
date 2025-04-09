//
//  ProductDetailsRemoteDataSourceProtocol.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 6/04/25.
//

/// Protocolo que define una fuente de datos remota para obtener los detalles de un producto.
/// Implementaciones de este protocolo son responsables de realizar la llamada al backend
/// y devolver una respuesta estructurada con los datos del producto.
///
/// Este protocolo es `Sendable`, lo que permite su uso seguro en contextos concurrentes.
protocol ProductDetailsRemoteDataSourceProtocol: Sendable {
    
    /// Realiza una solicitud para obtener los detalles de un producto desde una fuente de datos remota.
    ///
    /// - Parameter request: Un objeto `ProductDetailsRequest` que contiene la información necesaria para la consulta, como el ID del producto.
    /// - Returns: Un objeto `ProductDetailsResponse` con los datos del producto, incluyendo nombre, descripción, imágenes, atributos, etc.
    /// - Throws: Un error de tipo `ProductDetailsError` si ocurre un error durante la operación remota, como problemas de red o errores del servidor.
    func call(_ request: ProductDetailsRequest) async throws -> ProductDetailsResponse
}
