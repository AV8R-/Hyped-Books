//
//  ServiceLocator.swift
//  ServiceLocator
//
//  Created by Богдан Маншилин on 02/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import Foundation

public protocol ServiceLocator: class {
    func register<Service>(_ factory: @escaping () throws -> Service)
    func inject<Service>() throws -> Service
    
    static func register<Service>(_ factory: @escaping () throws -> Service)
    static func inject<Service>() throws -> Service
}
