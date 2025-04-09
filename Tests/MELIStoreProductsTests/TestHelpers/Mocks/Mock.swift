//
//  Mock.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 9/04/25.
//

protocol Mock {
    func resolve<T>(_ result: Result<T, Error>?) throws -> T
}

extension Mock {
    func resolve<T>(_ result: Result<T, Error>?) throws -> T {
        guard let result else { throw MockError.nilValue }
        
        switch result {
        case .success(let data):
            return data
        case .failure(let failure):
            throw failure
        }
    }
}
