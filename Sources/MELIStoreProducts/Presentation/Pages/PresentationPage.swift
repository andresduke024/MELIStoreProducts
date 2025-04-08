//
//  PresentationPage.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 7/04/25.
//

import SwiftUI
import MELIStoreCore
import MELIStoreDesignSystem

struct PresentationPage: View {
    @EnvironmentObject
    private var router: Router
    
    init() {}

    var body: some View {
        PrimaryBackgroundContainer(ignoresSafeAreaFor: .all) {
            PresentationOrganism(
                onSearch: onSearch(_:)
            )
            .padding()
        }
    }
    
    private func onSearch(_ text: String) {
        let newDestination = ModuleRoutes.plp(searchText: text)
        router.push(newDestination)
    }
}

#Preview {
    PresentationPage()
        .environmentObject(Router())
}
