//
//  HTTPManagerMock.swift
//  MELIStoreProducts
//
//  Created by Andres Duque on 8/04/25.
//

@testable import MELIStoreCore

struct MockHTTPManager: HTTPManagerProtocol {
    
    private let result: Result<Decodable & Sendable, Error>
    
    init(result: Result<Decodable & Sendable, Error>) {
        self.result = result
    }
    
    func post<T>(
        endpoint: any MELIStoreCore.EndpointProtocol,
        extraHeaders: (
            (MELIStoreCore.HeadersBuilder) async -> MELIStoreCore.HeadersBuilder
        )?,
        requiresAuthentication: Bool,
        body: (any MELIStoreCore.RequestModelProtocol)?,
        requestErrorMapper: ((MELIStoreCore.RequestError) -> any Error)?
    ) async throws -> T where T: Decodable, T: Sendable {
        return try castResult(
            requestErrorMapper: requestErrorMapper
        )
    }

    func get<T>(
        endpoint: any MELIStoreCore.EndpointProtocol,
        extraHeaders: (
            (MELIStoreCore.HeadersBuilder) async -> MELIStoreCore.HeadersBuilder
        )?,
        requiresAuthentication: Bool,
        queryParams: (any MELIStoreCore.QueryParamsModelProtocol)?,
        requestErrorMapper: ((MELIStoreCore.RequestError) -> any Error)?
    ) async throws -> T where T: Decodable, T: Sendable {
        return try castResult(
            requestErrorMapper: requestErrorMapper
        )
    }

    private func castResult<T>(
        requestErrorMapper: ((MELIStoreCore.RequestError) -> any Error)?
    ) throws -> T {
        switch result {
        case .success(let success):
            guard let data = success as? T else {
                throw MockError.invalidType
            }
            
            return data
        case .failure(let failure):
            if let error = failure as? RequestError, let requestErrorMapper {
                throw requestErrorMapper(error)
            }
            
            throw failure
        }
    }
}
