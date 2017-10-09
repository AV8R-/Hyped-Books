//
//  PopularBooksProtocols.swift
//  Hyped Books
//
//  Created by Богдан Маншилин on 08/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import class UIKit.UICollectionViewCell
import protocol APIService.APIServiceError

protocol PopularBooksCollectionViewDataSource {
    associatedtype Model
    
    func configure(book: BookInput, atIndex: Int)
    func itemsCount() -> Int
}

protocol PopularBooksViewPresenterProtocol: PopularBooksCollectionViewDataSource {
    func loadMore()
}

protocol PopularBooksPresenterModelProtocol: class {
    func blockLoadMore()
    func handle(error: APIServiceError)
    func reload()
}

protocol PopularBooksViewProtocol: class {
    func blockLoadMore()
    func showError(title: String, description: String)
    func reload()
}

protocol PopularBooksModelProtocol: class {
    associatedtype Model
    var books: [Model] { get }
    func loadMore()
}

protocol BookInputContaining {
    var input: BookInput! { get }
}
