//
//  ServiceLoader.swift
//  ServiceLocator
//
//  Created by Богдан Маншилин on 02/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import Foundation

public final class ServiceLoader: ServiceLocator {
    
    enum Error: Swift.Error {
        case serviceNotFound
    }
    
    private var registry: [ObjectIdentifier : () throws -> Any] = [:]
    
    public static var shared: ServiceLocator = ServiceLoader()
    public init() {}
    
    // MARK: - Registration
    
    public func register<Service>(_ factory: @escaping () throws -> Service) {
        registry[ObjectIdentifier(Service.self)] = factory
    }
    
    public static func register<Service>(_ factory: @escaping () throws -> Service) {
        shared.register(factory)
    }
    
    // MARK: - Injection
    
    public static func inject<Service>() throws -> Service {
        return try shared.inject()
    }
    
    public func inject<Service>() throws -> Service {
        guard let service = try registry[ObjectIdentifier(Service.self)]?() as? Service else {
            throw Error.serviceNotFound
        }
        return service
    }
}
