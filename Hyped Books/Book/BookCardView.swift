//
//  BookCardView.swift
//  Hyped Books
//
//  Created by Богдан Маншилин on 08/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import UIKit

final class BookCardView: UIView, BookViewProtocol {
    var presenter: BookViewPresenterProtocol!
    
    @IBOutlet weak var cover: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var annotation: UILabel!
    
    func set(title: String) {
        self.title.text = title
    }
    
    func set(author: String) {
        self.author.text = author
    }
    
    func set(coverFromURL url: URL) {
        self.cover.backgroundColor = .random
    }
    
    func set(annotation: String) {
        DispatchQueue.global().async {
            let attributed = NSAttributedString(html: annotation)
            DispatchQueue.main.async {
                self.annotation.attributedText = attributed
            }
        }
    }
}
