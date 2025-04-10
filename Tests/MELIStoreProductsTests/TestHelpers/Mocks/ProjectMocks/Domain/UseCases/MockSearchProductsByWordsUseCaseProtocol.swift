//
//  MockSearchProductsByWordsUseCaseProtocol.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 9/04/25.
//

@testable import MELIStoreProducts

struct MockSearchProductsByWordsUseCaseProtocol: SearchProductsByWordsUseCaseProtocol, Mock {
    var result: Result< [ListProductEntity], Error>?
    
    init(
        result: Result< [ListProductEntity], Error>? = nil
    ) {
        self.result = result
    }
    
    func invoke(data: ProductsSearchEntity) async throws -> [ListProductEntity] {
        try resolve(result)
    }
}
