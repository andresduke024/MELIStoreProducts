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

/// Objeto observable responsable de gestionar el estado y la lógica de presentación
/// para la búsqueda de productos.
///
/// Se comunica con la capa de dominio a través del caso de uso `SearchProductsByWordsUseCaseProtocol`,
/// y transforma los resultados a modelos de UI utilizando `ListProductUIMapper`.
///
/// Usa un identificador único para manejar la paginación por búsqueda.
@Observable
@MainActor
final class ProductsSearchObservableObject {
    
    /// Caso de uso encargado de realizar la búsqueda de productos.
    @ObservationIgnored
    @Inject
    private var searchProductsByWordsUseCase: SearchProductsByWordsUseCaseProtocol
    
    /// Mapper para transformar entidades de dominio en modelos de presentación.
    @ObservationIgnored
    @Inject
    private var plpProductsMapper: ListProductUIMapper
    
    /// ID que identifica la búsqueda actual, útil para manejar la paginación.
    @ObservationIgnored
    private var currentSearchId: String = ""
    
    /// Texto ingresado por el usuario en el buscador.
    var searchText: FieldContentWrapper
    
    /// Flag que indica si los productos se están cargando.
    var isLoadingProducts: Bool = false
    
    var bottomReachedMessage: String?
    
    /// Productos obtenidos de la búsqueda, listos para mostrar en UI.
    var products: [ListProductUIModel] = []
    
    /// Error ocurrido durante la búsqueda, si aplica.
    var searchError: ProductSearchError? = nil
    
    /// Inicializa el observable con un texto de búsqueda opcional.
    ///
    /// - Parameter searchText: Texto inicial a buscar.
    init(searchText: String) {
        self.searchText = SearchTextContentWrapper.value(searchText)
    }
    
    /// Inicia una nueva búsqueda de productos. Borra resultados anteriores.
    func startSearch() async {
        guard !searchText.content.isEmpty else { return }
        
        currentSearchId = UUID().uuidString
        products.removeAll()
        searchError = nil
        bottomReachedMessage = nil
        
        await loadProducts()
    }
    
    /// Carga más productos para la búsqueda actual o inicia una nueva si no existe.
    func handleProductsLoad() async {
        if currentSearchId.isEmpty {
            await startSearch()
            return
        }
        
        await loadProducts()
    }

    /// Carga los productos desde la capa de dominio según el estado actual.
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
    
    /// Maneja el mapeo y agregado de nuevos productos.
    ///
    /// - Parameter results: Nuevos productos desde el backend.
    private func onNewProductsLoaded(_ results: [ListProductEntity]) {
        let newProducts = plpProductsMapper.map(results)
        
        if !results.isEmpty {
            bottomReachedMessage = nil
            products.append(contentsOf: newProducts)
            return
        }
        
        if products.isEmpty {
            searchError = .notFound
        }
    }
    
    /// Asigna un error de búsqueda si no hay productos cargados.
    ///
    /// - Parameter error: Error específico de búsqueda.
    private func onError(_ error: ProductSearchError) {
        if products.isEmpty {
            searchError = error
            return
        }
        
        bottomReachedMessage = switch error {
        case .notFound:
            ModuleStrings.notMoreProductsToLoad
        default:
            ModuleStrings.errorLoadingProducts
        }
    }
}
