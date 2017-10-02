//
//  MoyaAPIClient.swift
//  Services
//
//  Created by Богдан Маншилин on 02/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import Foundation
import Moya
import Result

public final class MoyaAPIClient {
    let provider = MoyaProvider<Endpoint>()
    public init() {}
}

extension MoyaAPIClient: APIClient {
    public func request<V, E>(
        _ endpoint: Endpoint,
        completion: @escaping (Result<V, E>) -> Void
        )
        where E: APIServiceError
    {
        provider.request(endpoint) { result in
            switch result {
            case .success(let response):
                do {
                    let json = try response
                        .filterSuccessfulStatusCodes()
                        .mapJSON()
                    
                    print(json)
                } catch let error as MoyaError {
                    let apiError = error.apiError
                    completion(.failure(E(apiError: apiError)))
                } catch {
                    let apiError = error.apiError
                    completion(.failure(E(apiError: apiError)))
                }
            case .failure(let error):
                let apiError = error.apiError
                completion(.failure(E(apiError: apiError)))
            }
        }
    }
}

extension MoyaError {
    var apiError: APIError {
        return .nested(error: self)
    }
}

extension Swift.Error {
    var apiError: APIError {
        return .nested(error: self)
    }
}

extension Result {
    static func failure(error: Result.Error) -> Result {
        return Result(error: error)
    }
    
    static func success(value: Result.Value) -> Result {
        return Result(value: value)
    }
}
