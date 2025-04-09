//
//  PaginationManagerProtocol.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

/// Protocolo que define el comportamiento esperado de un manejador de paginación.
///
/// Este protocolo permite iniciar un flujo de obtención de datos que dependa de un desplazamiento (offset),
/// facilitando la lógica de paginación a través de una única función genérica.
protocol PaginationManagerProtocol: Sendable {
    
    /// Inicia un proceso de paginación para obtener datos a partir de propiedades de control.
    ///
    /// - Parameters:
    ///   - properties: Propiedades necesarias para controlar la paginación (`PaginationProperties`), como el identificador del recurso paginado.
    ///   - getDataFromOffset: Función asíncrona que recibe un nuevo offset (`newInterval`) y devuelve el resultado deseado.
    ///
    /// - Returns: Un valor de tipo `T` obtenido mediante la ejecución de `getDataFromOffset`.
    /// - Throws: Propaga cualquier error ocurrido durante la obtención de los datos.
    func start<T: Sendable>(
        properties: PaginationProperties,
        execute getDataFromOffset: @Sendable @escaping (_ newInterval: Int) async throws -> T
    ) async throws -> T
}
