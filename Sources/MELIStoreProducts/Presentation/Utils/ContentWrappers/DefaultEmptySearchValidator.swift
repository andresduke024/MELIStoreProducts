//
//  DefaultEmptyValidator.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 9/04/25.
//

import MELIStoreCore

/// Utilidad que construye un `FieldContentWrapper` con reglas de validación para búsquedas.
///
/// Este contenedor está pensado para encapsular el texto ingresado por el usuario en el buscador,
/// añadiendo una validación que asegura que el valor no esté vacío.
///
/// - Note: Utiliza `EmptyValidator` para mostrar un mensaje de error personalizado si el campo está vacío.
struct SearchTextContentWrapper {
    
    /// Construye un `FieldContentWrapper` con validación de campo no vacío.
    ///
    /// - Parameter initialValue: Valor inicial del campo. Por defecto, es una cadena vacía.
    /// - Returns: Una instancia de `FieldContentWrapper` con las reglas aplicadas.
    static func value(
        _ initialValue: String = ""
    ) -> FieldContentWrapper {
        .build(
            initialValue: initialValue,
            rules: [ EmptyValidator(message: ModuleStrings.emptySearchError) ]
        )
    }
}
