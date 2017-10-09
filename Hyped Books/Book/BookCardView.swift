//
//  BookCardView.swift
//  Hyped Books
//
//  Created by Богдан Маншилин on 08/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import UIKit

final class BookCardView: UIView, BookViewProtocol {
    let presenter: BookViewPresenterProtocol
    weak var title: UILabel!
    
    init(presenter: BookViewPresenterProtocol) {
        self.presenter = presenter
        super.init(frame: .zero)
        
        let title = UILabel()
        addSubview(title)
        try! title.constrainSuperview()
        
        self.title = title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(title: String) {
        self.title.text = title
    }
    
    func set(author: String) {
        
    }
    
    func set(coverFromURL url: URL) {
        
    }
    
    func set(annotation: String) {
        
    }
}
