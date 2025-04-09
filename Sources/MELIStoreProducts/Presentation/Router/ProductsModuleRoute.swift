//
//  TestView.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

import SwiftUI
import MELIStoreCore

/// Vista de entrada principal del módulo de productos.
///
/// Define la navegación interna del módulo a través del uso del enum `ModuleRoutes`.
/// Esta vista actúa como router declarativo, iniciando con la `PresentationPage`.
public struct ProductsModuleRoute: View {
    
    /// Inicializador público requerido para cumplir con el protocolo `View`.
    public init() {}
    
    /// Cuerpo de la vista que establece la página de presentación como punto de partida.
    /// Usa `.navigationDestination` para manejar rutas declaradas en `ModuleRoutes`.
    public var body: some View {
        PresentationPage()
            .navigationDestination(
                for: ModuleRoutes.self,
                destination: navigateTo(_:)
            )
    }
    
    /// Navega a la vista correspondiente dependiendo de la ruta.
    ///
    /// - Parameter route: Ruta definida en `ModuleRoutes`.
    @ViewBuilder
    private func navigateTo(_ route: ModuleRoutes) -> some View {
        switch route {
        case .plp(let searchText):
            ProductsListPage(searchText: searchText)
        case .pdp(let id):
            ProductDetailsPage(id: id)
        }
    }
}
