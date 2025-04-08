//
//  ProductsListPage.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 6/04/25.
//

import SwiftUI
import MELIStoreCore
import MELIStoreDesignSystem

struct ProductsListPage: View {
 
    @Environment(\.theme)
    private var theme: ThemeManager
    
    @EnvironmentObject
    private var router: Router
    
    @State
    private var observableObject: ProductsSearchObservableObject
    
    init(searchText: String) {
        _observableObject = State(
            initialValue: ProductsSearchObservableObject(searchText: searchText)
        )
    }
    
    var body: some View {
        VStack(spacing: DSSpacing.spacing8) {
            SearchHeaderOrganism(
                title: ModuleStrings.appName,
                searchText: $observableObject.searchText,
                onBackPress: {
                    router.pop()
                },
                onSearchCommit: {
                    Task { await observableObject.startSearch() }
                }
            )
            
            ProductsSearchResultsOrganism(
                products: observableObject.products,
                error: observableObject.searchError,
                isLoading: observableObject.isLoadingProducts,
                onItemSelected: { product in
                    let newDestination = ModuleRoutes.pdp(id: product.id)
                    router.push(newDestination)
                },
                onItemsBottomReached: {
                    Task { await observableObject.handleProductsLoad() }
                }
            )
            
            Spacer()
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ProductsListPage(
        searchText: ""
    )
}
