//
//  PagedBookService.swift
//  BooksService
//
//  Created by Богдан Маншилин on 08/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import Foundation
import Pager
import struct Model.Book
import Result

public final class PagedBookServie: PagedService {
    public typealias Model = Book
    public typealias Error = BookError
    
    let service: BooksService
    
    public init(service: BooksService) {
        self.service = service
    }
    
    public func fetchLoaded(
        _ completion: @escaping (Result<[Model], Error>
        ) -> Void)
    {
        completion(.failure(.noPersistanteStorage))
    }
    
    public func load(
        page: Int,
        _ completion: @escaping (Result<[Model], Error>) -> Void
        )
    {
        service.fetchList(page: page, completion: completion)
    }
    
    public func cancel() {
        service.cancelAll()
    }
    
}

extension Book: Identifiable {
    public typealias Identifier = String
}
