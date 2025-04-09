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
@MainActor
final class ProductsSearchObservableObject {
    
    @ObservationIgnored
    @Inject
    private var searchProductsByWordsUseCase: SearchProductsByWordsUseCase
    
    @ObservationIgnored
    @Inject
    private var plpProductsMapper: ListProductUIMapper
    
    @ObservationIgnored
    private var currentSearchId: String = ""
    
    var searchText: String = ""
    
    var isLoadingProducts: Bool = false
    
    var products: [ListProductUIModel] = []
    
    var searchError: ProductSearchError? = nil
    
    init(searchText: String) {
        self.searchText = searchText
    }
    
    func startSearch() async {
        guard !searchText.isEmpty else { return }
        
        currentSearchId = UUID().uuidString
        products.removeAll()
        searchError = nil
        
        await loadProducts()
    }
    
    func handleProductsLoad() async {
        if currentSearchId.isEmpty {
            await startSearch()
            return
        }
        
        await loadProducts()
    }
    
    private func loadProducts() async {
        do {
            guard !isLoadingProducts, !searchText.isEmpty else { return }
            
            defer { isLoadingProducts = false }
            
            isLoadingProducts = true
            
            let data = ProductsSearchEntity(searchId: currentSearchId, words: searchText)
            let results = try await searchProductsByWordsUseCase.invoke(data: data)
            
            onNewProductsLoaded(results)
        } catch let error as ProductSearchError {
            searchError = error
        } catch {
            searchError = .unknown
        }
    }
    
    private func onNewProductsLoaded(_ results: [ListProductEntity]) {
        let newProducts = plpProductsMapper.map(results)
        
        if !results.isEmpty {
            products.append(contentsOf: newProducts)
            return
        }
        
        if products.isEmpty {
            searchError = .notFound
        }
    }
}
