//
//  ProductsListOrganism.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 7/04/25.
//

import MELIStoreCore
import MELIStoreDesignSystem
import SwiftUI

struct ProductsListOrganism: View {

    private let items: [ListProductUIModel]
    private let isLoadingItems: Bool
    private let onItemSelected: (ListProductUIModel) -> Void
    private let onItemsBottomReached: () -> Void

    init(
        items: [ListProductUIModel],
        isLoadingItems: Bool,
        onItemSelected: @escaping (ListProductUIModel) -> Void,
        onItemsBottomReached: @escaping () -> Void
    ) {
        self.items = items
        self.isLoadingItems = isLoadingItems
        self.onItemSelected = onItemSelected
        self.onItemsBottomReached = onItemsBottomReached
    }

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(items) { item in
                    listItemOrganism(item)
                }
                
                Color.clear.onAppear {
                    onItemsBottomReached()
                }
            }

            if isLoadingItems { loading }
        }
        .edgesIgnoringSafeArea(.bottom)
        .padding()
    }
    
    @ViewBuilder
    private func listItemOrganism(_ item: ListProductUIModel) -> some View {
        ListItemOrganism(
            image: item.image,
            title: item.name,
            onPress: { onItemSelected(item) }
        )
        .padding(.vertical, DSSpacing.spacing6)
    }
    
    @ViewBuilder
    private var loading: some View {
        ProgressView()
            .padding(DSSpacing.spacing26)
    }
}

#Preview {
    ProductsListOrganism(
        items: [],
        isLoadingItems: false,
        onItemSelected: { _ in },
        onItemsBottomReached: {}
    )
}
