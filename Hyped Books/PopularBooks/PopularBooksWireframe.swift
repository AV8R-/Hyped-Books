//
//  PopularBooksWireframe.swift
//  Hyped Books
//
//  Created by Богдан Маншилин on 08/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import UIKit
import func ServiceLocator.inject
import BooksService
import Pager
import Model

final class PopularBooksWireframe {
    private init() {}
    
    static func make<Output>(output: Output)
        throws -> UIViewController
        where
            Output: BookOutput,
            Output.Model == Book
    {
        let service = PagedBookService(service: try inject())
        let model = PopularBooksModel(pager: Pager(service: service))
        let presetnter = PopularBooksPresenter(model: model, output: output)
        let view = PopularBooksCollectionView(
            cell: BookViewCellAdaptor.self,
            presenter: presetnter
        )
        
        presetnter.view = view
        model.presenter = presetnter
        
        return view
    }
}
