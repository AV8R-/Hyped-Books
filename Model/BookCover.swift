//
//  BookCover.swift
//  Model
//
//  Created by Богдан Маншилин on 02/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import Foundation

public struct BookCover: Codable {
    let large: URL
    let placeholder: Data?
    let ratio: Double
    let small: URL
}
