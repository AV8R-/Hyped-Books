//
//  BooksService.swift
//  BooksService
//
//  Created by Богдан Маншилин on 02/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import Foundation
import Result
import Model
import APIService

public enum BookError: APIServiceError {
    public init(apiError: APIError) {
        self = .nested(api: apiError)
    }
    
    case nested(api: APIError)
    case noPersistanteStorage
    
    public var title: String {
        switch self {
        case .noPersistanteStorage: return "Failed to fetch local books"
        case .nested(let error): return error.title
        }
    }
    
    public var description: String {
        return "Contant support"
    }
}

public protocol BooksService {
    func fetchList(
        page: Int,
        completion: @escaping (Result<[Book], BookError>) -> Void
    )
    
    func fetchBook(
        byUUID uuid: String,
        completion: @escaping (Result<Book, BookError>) -> Void
    )
    
    func cancelAll()
}

