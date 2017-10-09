//
//  PopularListOutput.swift
//  Hyped Books
//
//  Created by Богдан Маншилин on 09/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import Foundation
import Model

final class PopularListOutput: BookOutput {
    typealias Model = Book
    weak var application: Application!
    
    func didPick(book: Book) {
        let bookController = BookWebViewController(uuid: book.uuid)
        let nc = UINavigationController(rootViewController: bookController)
        let output = BookDetailApplicaitonOutput()
        output.application = application
        application.outputs.append(output)
        bookController.output = output
        application.rootViewController.present(
            nc,
            animated: true,
            completion: nil
        )
    }
    
}


