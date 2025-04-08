//
//  ModuleDependenciesContainer.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 5/04/25.
//

import MELIStoreCore
import SwiftDependencyInjector

struct ModuleDependenciesContainer: DependenciesContainer {
    func registerDependencies() {
        registerUtils()
        registerMappers()
        registerDataSources()
        registerRepositories()
        registerUseCases()
    }
    
    private func registerUtils() {
        Injector.global.register(PaginationManagerProtocol.self) {
            PaginationManager()
        }
    }
    
    private func registerMappers() {
        // Data layer mappers
        Injector.global.register(ProductAttributesMapper.self) {
            ProductAttributesMapper()
        }
        
        Injector.global.register(ProductPicturesMapper.self) {
            ProductPicturesMapper()
        }
        
        Injector.global.register(ProductSearchMapper.self) {
            ProductSearchMapper()
        }
        
        Injector.global.register(ProductDetailsMapper.self) {
            ProductDetailsMapper()
        }
        
        // Presentation layer mappers
        Injector.global.register(PLPProductsMapper.self) {
            PLPProductsMapper()
        }
    }
    
    private func registerDataSources() {
        Injector.global.register(ProductsSearchRemoteDataSourceProtocol.self) {
            ProductsSearchRemoteDataSource()
        }
        
        Injector.global.register(ProductDetailsRemoteDataSourceProtocol.self) {
            ProductDetailsRemoteDataSource()
        }
    }
    
    private func registerRepositories() {
        Injector.global.register(ProductsRepositoryProtocol.self) {
            ProductsRepository()
        }
    }
    
    private func registerUseCases() {
        Injector.global.register(SearchProductsByWordsUseCase.self) {
            SearchProductsByWordsUseCase()
        }
    }
}
