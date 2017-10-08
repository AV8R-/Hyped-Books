//
//  Label.swift
//  Model
//
//  Created by Богдан Маншилин on 02/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import Foundation

public struct Label: Codable {
    public enum Kind: String, Codable {
        case `default`
        case `private`
        case premium
    }
    public let kind: Kind
    public let title: String
}
