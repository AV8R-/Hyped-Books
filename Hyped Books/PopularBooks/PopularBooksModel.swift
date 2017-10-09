//
//  PopularBooksModel.swift
//  Hyped Books
//
//  Created by Богдан Маншилин on 08/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import Foundation
import BooksService
import Pager
import Model

final class PopularBooksModel: PopularBooksModelProtocol {
    typealias Model = Book
    
    private let booksPager: Pager<PagedBookService>
    private(set) var books: [Model] = []
    weak var presenter: PopularBooksPresenterModelProtocol! {
        didSet {
            loadMore()
        }
    }
    
    init(pager: Pager<PagedBookService>) {
        self.booksPager = pager
    }
    
    func loadMore() {
        self.booksPager.loadMore { [weak self] result in
            switch result {
            case .success(let new):
                self?.books.append(contentsOf: new)
                self?.presenter.reload()
            case .failure(let error):
                switch error {
                case .allLoaded: self?.presenter.blockLoadMore()
                case .service(let error): self?.presenter.handle(error: error)
                }
            }
        }
    }
}
