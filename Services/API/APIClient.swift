//
//  APIClient.swift
//  Services
//
//  Created by Богдан Маншилин on 02/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import Foundation
import Result

public protocol APIClient {
    func request<V, E>(
        _ endpoint: Endpoint,
        completion: @escaping (Result<V, E>) -> Void
    )
    where E: APIServiceError
}

public protocol APIServiceError: Error {
    init(apiError: APIError)
}

public enum APIError: Swift.Error {
    case nested(error: Swift.Error)
}
