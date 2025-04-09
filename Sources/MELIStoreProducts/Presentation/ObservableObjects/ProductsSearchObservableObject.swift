//
//  ProductsSearchObservableObject.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

import Foundation
import Observation
import MELIStoreCore
import SwiftDependencyInjector

@Observable
@MainActor
final class ProductsSearchObservableObject {
    
    @ObservationIgnored
    @Inject
    private var searchProductsByWordsUseCase: SearchProductsByWordsUseCaseProtocol
    
    @ObservationIgnored
    @Inject
    private var plpProductsMapper: ListProductUIMapper
    
    @ObservationIgnored
    private var currentSearchId: String = ""
    
    var searchText: FieldContentWrapper
    
    var isLoadingProducts: Bool = false
    
    var products: [ListProductUIModel] = []
    
    var searchError: ProductSearchError? = nil
    
    init(searchText: String) {
        self.searchText = SearchTextContentWrapper.value(searchText)
    }
    
    func startSearch() async {
        guard !searchText.content.isEmpty else { return }
        
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
            guard !isLoadingProducts, !searchText.content.isEmpty else { return }
            
            defer { isLoadingProducts = false }
            
            isLoadingProducts = true
            
            let data = ProductsSearchEntity(searchId: currentSearchId, words: searchText.content)
            let results = try await searchProductsByWordsUseCase.invoke(data: data)
            
            onNewProductsLoaded(results)
        } catch let error as ProductSearchError {
            onError(error)
        } catch {
            onError(.unknown)
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
    
    private func onError(_ error: ProductSearchError) {
        if !products.isEmpty { return }
        
        searchError = error
    }
}
