//
//  PopularBooksProtocols.swift
//  Hyped Books
//
//  Created by Богдан Маншилин on 08/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import class UIKit.UICollectionViewCell

protocol PopularBooksCollectionViewDataSource {
    associatedtype Model
    associatedtype Cell: UICollectionViewCell
    
    func configure(cell: Cell, atIndex: Int)
    func itemsCount() -> Int
}


protocol PopularBooksPresenterProtocol: PopularBooksCollectionViewDataSource {
    
}
