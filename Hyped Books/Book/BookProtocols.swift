//
//  BookProtocols.swift
//  Hyped Books
//
//  Created by Богдан Маншилин on 08/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import Foundation
import Model

protocol BookViewProtocol: class {
    func set(title: String)
    func set(author: String)
    func set(coverFromURL url: URL)
    func set(annotation: String)
}

protocol BookViewPresenterProtocol: class {
}

protocol BookPresenterModelProtocol: class {
}

protocol BookModelProtocol: class {
}

protocol BookInput: class {
    func set(book: Book)
}
