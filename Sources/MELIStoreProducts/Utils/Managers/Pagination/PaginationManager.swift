//
//  PaginationManager.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

import MELIStoreCore
import SwiftDependencyInjector

/// Implementación del protocolo `PaginationManagerProtocol` que administra la lógica de paginación con manejo de intentos.
///
/// Esta clase utiliza un actor para garantizar la seguridad en concurrencia durante procesos de paginación
/// en operaciones asincrónicas, como búsquedas remotas. También incluye integración con un manejador de reintentos.
actor PaginationManager: PaginationManagerProtocol {

    /// Manejador de reintentos para ejecutar operaciones con múltiples intentos en caso de error.
    @Inject
    private var attemptsManager: AttemptsManagerProtocol
        
    /// Identificador actual del proceso de paginación.
    private var paginationId: String
    
    /// Último offset aplicado en la paginación.
    private var lastPaginationOffset: Int

    /// Inicializador por defecto.
    ///
    /// Establece el identificador de paginación vacío y el offset inicial definido por el módulo.
    init() {
        self.paginationId = ""
        self.lastPaginationOffset = ModuleConstants.paginationStartIndex
    }

    /// Inicia un flujo de paginación a partir de las propiedades entregadas y una función asincrónica que obtiene los datos.
    ///
    /// - Parameters:
    ///   - properties: Propiedades de configuración de la paginación como ID y tamaño de intervalo.
    ///   - getDataFromOffset: Función asincrónica que recibe un nuevo offset y retorna los datos deseados.
    /// - Returns: Resultado obtenido desde la función entregada.
    /// - Throws: Errores que se produzcan durante el proceso, incluyendo fallos en los reintentos.
    func start<T: Sendable>(
        properties: PaginationProperties,
        execute getDataFromOffset: @Sendable @escaping (_ newInterval: Int) async throws -> T
    ) async throws -> T {
        let mustRestorePagination = properties.id != paginationId

        let newOffset =
            mustRestorePagination
            ? ModuleConstants.paginationStartIndex
            : lastPaginationOffset + properties.interval

        if mustRestorePagination {
            paginationId = properties.id
            lastPaginationOffset = ModuleConstants.paginationStartIndex
        }

        let attempts =  CoreConstants.maxExecutionAttempts
        
        let result = try await attemptsManager.execute(maxAttempts: attempts) {
            try await getDataFromOffset(newOffset)
        }
        
        lastPaginationOffset = newOffset
        return result
    }
}
