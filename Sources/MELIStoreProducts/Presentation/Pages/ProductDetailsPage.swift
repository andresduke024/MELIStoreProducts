//
//  ProductDetailsPage.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 7/04/25.
//

import MELIStoreCore
import MELIStoreDesignSystem
import SwiftUI

struct ProductDetailsPage: View {

    @State
    private var observableObject: ProductDetailsObservableObject

    @EnvironmentObject
    private var router: Router

    init(id: String) {
        _observableObject = State(
            initialValue: ProductDetailsObservableObject(id: id)
        )
    }
    
    private var hasError: Bool {
        observableObject.detailsError != nil
    }
    
    var body: some View {
        VStack(spacing: DSSpacing.spacingNone) {
            header

            if hasError { error }
            else { page }
            
            Spacer()
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            Task { await observableObject.loadDetails() }
        }
    }
    

    @ViewBuilder
    private var header: some View {
        HeaderOrganism<EmptyView>(
            title: ModuleStrings.appName,
            onBackPress: { router.pop() }
        )
    }
    
    @ViewBuilder
    private var page: some View {
        if let product = observableObject.product {
            details(product)
        } else {
            loading
        }
    }
    
    @ViewBuilder
    private func details(_ product: ProductDetailsUIModel) -> some View {
        ProductDetailsOrganism(
            product: product
        )
    }
    
    @ViewBuilder
    private var error: some View {
        GeneralErrorMolecule(
            text: ModuleStrings.generalErrorMessage
        )
    }

    @ViewBuilder
    private var loading: some View {
        ProgressView()
            .padding(DSSpacing.spacing26)
    }
}
