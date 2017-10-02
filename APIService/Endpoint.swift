//
//  Endpoints.swift
//  Services
//
//  Created by Богдан Маншилин on 02/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import Foundation

public enum Endpoint {
    case list(page: Int)
    case book(uuid: String)
}
