//
//  ProductSearchErrorOrganism.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 7/04/25.
//

import SwiftUI
import MELIStoreDesignSystem

struct ProductSearchErrorOrganism: View {
    
    private let error: ProductSearchError
    
    init(error: ProductSearchError) {
        self.error = error
    }
    
    var body: some View {
        switch error {
        case .notFound:
            NotFoundErrorMolecule(
                text: ModuleStrings.productNotFoundErrorMessage
            )
        default:
            GeneralErrorMolecule(
                text: ModuleStrings.generalErrorMessage
            )
        }
    }
}

#Preview {
    ProductSearchErrorOrganism(error: .notFound)
}
