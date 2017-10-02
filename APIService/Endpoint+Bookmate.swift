//
//  Endpoints+Bookmate.swift
//  Services
//
//  Created by Богдан Маншилин on 02/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import Foundation
import Moya

extension Endpoint: TargetType {
    public var baseURL: URL {
        return URL(string: "https://api.bookmate.com/api/v5")!
    }
    
    public var path: String {
        switch self {
        case .book(uuid: let uuid): return "/books/\(uuid)"
        case .list: return "/books/popular"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .book: return .requestPlain
        case .list(page: let page):
            return .requestParameters(
                parameters: ["page": page],
                encoding: URLEncoding.queryString
            )
        }
    }
    
    public var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
