//
//  Label.swift
//  Model
//
//  Created by Богдан Маншилин on 02/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import Foundation

public struct Label: Codable {
    enum Kind: String, Codable {
        case `private`
        case premium
    }
    let kind: Kind
    let title: String
}