//
//  PaginationProperties.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

/// Representa las propiedades necesarias para controlar un flujo de paginación.
///
/// Esta estructura encapsula la información requerida para manejar paginación
/// en procesos como búsqueda o carga de datos remota. Conforma al protocolo `Identifiable`
/// para facilitar su uso en colecciones o vistas que requieren identificadores únicos.
struct PaginationProperties: Identifiable {
    /// Identificador único del recurso o contexto asociado a la paginación.
    let id: String
    
    /// Tamaño del intervalo de resultados por página.
    ///
    /// Por defecto, se usa el valor definido en `ModuleConstants.defaultProductSearchLimit`.
    let interval: Int
    
    /// Inicializa las propiedades de paginación con un identificador y un valor opcional de intervalo.
    ///
    /// - Parameters:
    ///   - id: Identificador del recurso o contexto de búsqueda.
    ///   - interval: Tamaño del intervalo. Si no se proporciona, se usará el valor por defecto del módulo.
    init(
        id: String,
        interval: Int = ModuleConstants.defaultProductSearchLimit
    ) {
        self.id = id
        self.interval = interval
    }
}
