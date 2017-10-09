//
//  BookViewCell.swift
//  Hyped Books
//
//  Created by Богдан Маншилин on 09/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import UIKit

final class BookViewCellAdaptor: UICollectionViewCell, BookInputContaining {
    
    private(set) weak var input: BookInput!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let module = try! BookWireframe.make()
        contentView.addSubview(module.0)
        try! module.0.constrainSuperview()
        self.input = module.1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
