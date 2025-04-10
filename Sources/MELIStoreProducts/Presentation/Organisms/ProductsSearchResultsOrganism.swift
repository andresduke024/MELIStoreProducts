//
//  ProductsSearchOrganism.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 7/04/25.
//

import SwiftUI
import MELIStoreDesignSystem

struct ProductsSearchResultsOrganism: View {
    
    private let products: [ListProductUIModel]
    private let error: ProductSearchError?
    private let isLoading: Bool
    private let bottomReachedMessage: String?
    private let onItemSelected: (ListProductUIModel) -> Void
    private let onItemsBottomReached: () -> Void
    
    init(
        products: [ListProductUIModel],
        error: ProductSearchError?,
        isLoading: Bool,
        bottomReachedMessage: String?,
        onItemSelected: @escaping (ListProductUIModel) -> Void,
        onItemsBottomReached: @escaping () -> Void
    ) {
        self.products = products
        self.error = error
        self.isLoading = isLoading
        self.bottomReachedMessage = bottomReachedMessage
        self.onItemSelected = onItemSelected
        self.onItemsBottomReached = onItemsBottomReached
    }
    
    var body: some View {
        if error != nil { errorOrganism }
        else { listOrganism }
    }
    
    @ViewBuilder
    private var errorOrganism: some View {
        ProductSearchErrorOrganism(error: error ?? .unknown)
            .padding(.vertical, DSSpacing.spacing24)
    }
    
    @ViewBuilder
    private var listOrganism: some View {
        VStack {
            ProductsListOrganism(
                items: products,
                isLoadingItems: isLoading,
                onItemSelected: onItemSelected,
                onItemsBottomReached: onItemsBottomReached
            )
            
            if let bottomReachedMessage {
                ListBottomMessageMolecule(
                    text: bottomReachedMessage
                )
            }
        }
    }
}
