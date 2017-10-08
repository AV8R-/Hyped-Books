//
//  BookmateBookService.swift
//  BooksService
//
//  Created by Богдан Маншилин on 08/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import Foundation
import APIService
import struct Model.Book
import Result

public final class APIBookService: BooksService {
    
    let apiClient: APIClient
    
    public init(client: APIClient) {
        self.apiClient = client
    }
    
    public func fetchList(
        page: Int,
        completion: @escaping (Result<[Book], BookError>) -> Void
        )
    {
        apiClient.request(.list(page: page))
        { (result: Result<APIBookList, BookError>) in
            switch result {
            case .success(let list): completion(.success(list.books))
            case .failure(let error): completion(.failure(error))
            }
        }
    }
    
    public func fetchBook(
        byUUID uuid: String,
        completion: @escaping (Result<Book, BookError>) -> Void
        )
    {
        apiClient.request(.book(uuid: uuid))
        { (result: Result<APIBook, BookError>) in
            switch result {
            case .success(let book): completion(.success(book.book))
            case .failure(let error): completion(.failure(error))
            }
        }
    }
}

fileprivate struct APIBookList: Codable {
    let books: [Book]
}

fileprivate struct APIBook: Codable {
    let book: Book
}

extension Result {
    static func failure(error: Result.Error) -> Result {
        return Result(error: error)
    }
    
    static func success(value: Result.Value) -> Result {
        return Result(value: value)
    }
}
