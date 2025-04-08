//
//  ProductsSearchOrganism.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 7/04/25.
//

import SwiftUI
import MELIStoreDesignSystem

struct ProductsSearchResultsOrganism: View {
    
    private let products: [PLPProductUIModel]
    private let error: ProductSearchError?
    private let isLoading: Bool
    private let onItemSelected: (PLPProductUIModel) -> Void
    private let onItemsBottomReached: () -> Void
    
    init(
        products: [PLPProductUIModel],
        error: ProductSearchError?,
        isLoading: Bool,
        onItemSelected: @escaping (PLPProductUIModel) -> Void,
        onItemsBottomReached: @escaping () -> Void
    ) {
        self.products = products
        self.error = error
        self.isLoading = isLoading
        self.onItemSelected = onItemSelected
        self.onItemsBottomReached = onItemsBottomReached
    }
    
    var body: some View {
        if let error {
            ProductSearchErrorOrganism(error: error)
                .padding(.vertical, DSSpacing.spacing24)
        } else {
            ProductsListOrganism(
                items: products,
                isLoadingItems: isLoading,
                onItemSelected: onItemSelected,
                onItemsBottomReached: onItemsBottomReached
            )
        }
    }
}
