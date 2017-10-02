//
//  BookList.swift
//  Model
//
//  Created by Богдан Маншилин on 02/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import Foundation

struct List<T: Codable>: Codable {
    let values: [T]
    let title: String
}
