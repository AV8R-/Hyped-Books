//
//  BookPresenter.swift
//  Hyped Books
//
//  Created by Богдан Маншилин on 08/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import Foundation
import Model

final class BookPresenter: BookViewPresenterProtocol {
    
    weak var view: BookViewProtocol!
    var model: BookModelProtocol
    
    init(model: BookModelProtocol) {
        self.model = model
    }
    
}

extension BookPresenter: BookPresenterModelProtocol {
    
}

extension BookPresenter: BookInput {
    func set(book: Book) {
        view.set(title: book.title)
        view.set(author: book.authors)
        view.set(annotation: book.annotation ?? "")
        view.set(coverFromURL: book.cover.large)
    }
}
