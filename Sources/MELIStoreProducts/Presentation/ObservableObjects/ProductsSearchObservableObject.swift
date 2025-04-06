//
//  ProductsSearchObservableObject.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

import Foundation
import Observation
import SwiftDependencyInjector

@Observable
final class ProductsSearchObservableObject {
    
    @ObservationIgnored
    @Inject
    private var searchProductsByWordsUseCase: SearchProductsByWordsUseCase
    
    @ObservationIgnored
    @Inject
    private var plpProductsMapper: PLPProductsMapper
    
    @ObservationIgnored
    private var currentSearchId: String = ""
    
    var searchText: String = ""
    
    var isLoadingProducts: Bool = false
    
    var products: [PLPProductUIModel] = []
    
    func startSearch() async {
        guard !searchText.isEmpty else { return }
        
        currentSearchId = UUID().uuidString
        products.removeAll()
        
        await loadProducts()
    }
    
    func loadProducts() async {
        do {
            guard !isLoadingProducts else { return }
            
            isLoadingProducts.toggle()
            
            let data = ProductsSearchEntity(searchId: currentSearchId, words: searchText)
            let results = try await searchProductsByWordsUseCase.invoke(data: data)
            
            let newProducts = plpProductsMapper.map(results)
            
            products.append(contentsOf: newProducts)
            
            isLoadingProducts.toggle()
        } catch {
            // TODO: Handle error escenario
        }
    }
}
