//
//  Application.swift
//  Hyped Books
//
//  Created by Богдан Маншилин on 09/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import UIKit

final class Application {
    
    let rootViewController: UIViewController
    var outputs: [Any]
    
    init() throws {
        let output = PopularListOutput()
        let rootModule = try PopularBooksWireframe.make(output: output)
        rootViewController = rootModule
        
        outputs = [output]
        output.application = self
    }
    
}
