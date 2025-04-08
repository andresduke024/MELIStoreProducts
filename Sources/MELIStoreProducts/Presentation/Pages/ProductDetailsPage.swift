//
//  ProductDetailsPage.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 7/04/25.
//

import SwiftUI

struct ProductDetailsPage: View {
    
    @State
    private var observableObject: ProductDetailsObservableObject
    
    init(id: String) {
        _observableObject = State(
            initialValue: ProductDetailsObservableObject(id: id)
        )
    }
    
    var body: some View {
        Text("hello")
    }
}
