//
//  BookWireframe.swift
//  Hyped Books
//
//  Created by Богдан Маншилин on 09/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import UIKit

final class BookWireframe {
    private init() {}
    
    static func make() -> (UIView, BookInput) {
        let model = BookModel()
        let presenter = BookPresenter(model: model)
        let view = BookCardView(presenter: presenter)
        
        presenter.view = view
        model.presenter = presenter
        
        return (view, presenter)
    }
}
