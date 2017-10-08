//
//  BookCover.swift
//  Model
//
//  Created by Богдан Маншилин on 02/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import Foundation

public struct BookCover: Codable {
    public let large: URL
    public let placeholder: Data?
    public let ratio: Double
    public let small: URL
}
