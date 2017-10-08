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

