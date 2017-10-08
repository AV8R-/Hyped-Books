//
//  ServicesHUB+Books.swift
//  Services
//
//  Created by Богдан Маншилин on 08/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import Foundation
import BooksService
import protocol APIService.APIClient

extension ServiceHUB {
    func bookService(api: APIClient) -> () -> BooksService {
        return { APIBookService(client: api) }
    }
}
