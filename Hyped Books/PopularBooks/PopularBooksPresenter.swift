//
//  PopularBooksPresenter.swift
//  Hyped Books
//
//  Created by Богдан Маншилин on 08/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import UIKit
import struct Model.Book

final class PopularBooksPresenter: PopularBooksPresenterProtocol {
    typealias Cell = UICollectionViewCell
    typealias Model = Book
    
    func configure(cell: UICollectionViewCell, atIndex: Int) {
        let label = UILabel()
        label.text = "\(atIndex)"
        cell.contentView.addSubview(label)
        cell.backgroundColor = .random
        try! label.constrainSuperview()
    }
    
    func itemsCount() -> Int {
        return 10
    }
}
