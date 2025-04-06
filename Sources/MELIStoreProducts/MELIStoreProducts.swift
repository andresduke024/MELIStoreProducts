import MELIStoreCore

public struct ProductsModule: ModuleProtocol {
    
    public static let shared = ProductsModule()
    
    private init() {}
    
    public var dependenciesContainer: any DependenciesContainer {
        ModuleDependenciesContainer()
    }
}

