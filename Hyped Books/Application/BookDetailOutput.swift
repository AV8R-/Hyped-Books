//
//  BookDetailOutput.swift
//  Hyped Books
//
//  Created by Богдан Маншилин on 09/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import Foundation

final class BookDetailApplicaitonOutput: BookDetailOutput {
    weak var application: Application!
    
    func extit() {
        application.rootViewController.dismiss(animated: true) {
            self.application.outputs = self.application.outputs.filter {
                !($0 is BookDetailOutput)
            }
        }
    }
}
