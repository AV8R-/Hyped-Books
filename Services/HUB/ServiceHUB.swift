//
//  ServiceHUB.swift
//  Services
//
//  Created by Богдан Маншилин on 02/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import Foundation
import ServiceLocator

public final class ServiceHUB {
    public enum Services {
        static var api: APIClient?
    }
    
    public static let shared = ServiceHUB()
    
    public func prepare(locator: ServiceLocator) {
        locator.register(apiClient)
    }
}
