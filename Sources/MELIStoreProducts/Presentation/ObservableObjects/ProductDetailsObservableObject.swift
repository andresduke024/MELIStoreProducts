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
    @Inject
    private var detailsMapper: ProductDetailsUIMapper
    
    @ObservationIgnored
    private let id: String
    
    var product: ProductDetailsUIModel?
    
    var detailsError: ProductDetailsError?
    
    init(id: String) { self.id = id }
    
    func loadDetails() async {
        do {
            guard product == nil else { return }
            
            let result = try await getProductDetailsUseCase.invoke(id)
            
            product = detailsMapper.map(result)
        } catch let error as ProductDetailsError {
            detailsError = error
        } catch {
            detailsError = .unknown
        }
    }
}
