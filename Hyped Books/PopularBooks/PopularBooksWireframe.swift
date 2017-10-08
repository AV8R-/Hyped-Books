//
//  PopularBooksWireframe.swift
//  Hyped Books
//
//  Created by Богдан Маншилин on 08/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import UIKit

final class PopularBooksWireframe {
    private init() {}
    
    static func make() -> UIViewController {
        let presetnter = PopularBooksPresenter()
        let view = PopularBooksCollectionView(presenter: presetnter)
        return view
    }
}
