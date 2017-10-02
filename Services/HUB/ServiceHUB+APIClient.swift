//
//  ServiceHUB+APIClient.swift
//  Services
//
//  Created by Богдан Маншилин on 02/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import Foundation

extension ServiceHUB {
    func apiClient() -> APIClient {
        if let client = Services.api {
            return client
        }
        
        Services.api = MoyaAPIClient()
        
        return Services.api!
    }
}
