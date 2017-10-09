//
//  PopularBooksPresenter.swift
//  Hyped Books
//
//  Created by Богдан Маншилин on 08/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import Foundation
import struct Model.Book
import protocol APIService.APIServiceError

final class PopularBooksPresenter<ModelLayer, Output>:
    PopularBooksViewPresenterProtocol
where
    ModelLayer: PopularBooksModelProtocol,
    ModelLayer.Model == Book,
    Output: BookOutput,
    Output.Model == ModelLayer.Model
{
    typealias Model = ModelLayer.Model
    
    let model: ModelLayer
    weak var view: PopularBooksViewProtocol!
    weak var output: Output?
    
    init(model: ModelLayer, output: Output) {
        self.model = model
        self.output = output
    }
    
    func configure(book input: BookInput, atIndex: Int) {
        let book = model.books[atIndex]
        input.set(book: book)
    }
    
    func itemsCount() -> Int {
        return model.books.count
    }
    
    func didPick(bookAtIndex index: Int) {
        output?.didPick(book: model.books[index])
    }
    
    func loadMore() {
        model.loadMore()
    }
}

extension PopularBooksPresenter: PopularBooksPresenterModelProtocol {
    func blockLoadMore() {
        DispatchQueue.main.async(execute: view.blockLoadMore)
    }
    func handle(error: APIServiceError) {
        DispatchQueue.main.async {
            self.view
            .showError(title: error.title, description: error.description)
        }
    }
    func reload() {
        DispatchQueue.main.async(execute: view.reload)
    }
}

