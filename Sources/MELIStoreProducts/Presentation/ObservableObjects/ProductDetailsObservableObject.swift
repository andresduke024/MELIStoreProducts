//
//  ProductDetailsObservableObject.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 6/04/25.
//

import Observation
import SwiftDependencyInjector

@Observable
@MainActor
final class ProductDetailsObservableObject {
    
    @ObservationIgnored
    @Inject
    private var getProductDetailsUseCase: GetProductDetailsUseCase
    
    @ObservationIgnored
    private let id: String
    
    init(id: String) {
        self.id = id
    }
    
    func loadDetails() async {
        do {
            let result = try await getProductDetailsUseCase.invoke(id)
        } catch {
            // TODO: Handle errors
        }
    }
}
