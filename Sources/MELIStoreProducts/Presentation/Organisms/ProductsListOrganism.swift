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

    private let items: [PLPProductUIModel]
    private let isLoadingItems: Bool
    private let onItemSelected: (PLPProductUIModel) -> Void
    private let onItemsBottomReached: () -> Void

    init(
        items: [PLPProductUIModel],
        isLoadingItems: Bool,
        onItemSelected: @escaping (PLPProductUIModel) -> Void,
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
                    ListItemOrganism(
                        image: item.image,
                        title: item.name,
                        onPress: { onItemSelected(item) }
                    )
                    .padding(.vertical, DSSpacing.spacing6)
                }
                
                Color.clear.onAppear {
                    onItemsBottomReached()
                }
            }

            if isLoadingItems {
                ProgressView()
                    .padding(DSSpacing.spacing26)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .padding()

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
