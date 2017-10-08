//
//  PopularBooksPresenter.swift
//  Hyped Books
//
//  Created by Богдан Маншилин on 08/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import UIKit
import struct Model.Book
import protocol APIService.APIServiceError

final class PopularBooksPresenter<ModelLayer>:
    PopularBooksViewPresenterProtocol
where
    ModelLayer: PopularBooksModelProtocol,
    ModelLayer.Model == Book
{
    typealias Cell = UICollectionViewCell
    typealias Model = ModelLayer.Model
    
    let model: ModelLayer
    weak var view: PopularBooksViewProtocol!
    
    init(model: ModelLayer) {
        self.model = model
    }
    
    func configure(cell: UICollectionViewCell, atIndex: Int) {
        let book = model.books[atIndex]
        
        let label = UILabel()
        label.text = book.title
        cell.contentView.addSubview(label)
        cell.backgroundColor = .random
        try! label.constrainSuperview()
    }
    
    func itemsCount() -> Int {
        return model.books.count
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

