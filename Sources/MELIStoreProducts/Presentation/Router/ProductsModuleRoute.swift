//
//  TestView.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

import SwiftUI
import MELIStoreCore

public struct ProductsModuleRoute: View {
    
    public init() {}
    
    public var body: some View {
        PresentationPage()
            .navigationDestination(
                for: ModuleRoutes.self,
                destination: navigateTo(_:)
            )
    }
    
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
