//
//  Pager.swift
//  Pager
//
//  Created by Богдан Маншилин on 08/10/2017.
//  Copyright © 2017 BManshilin. All rights reserved.
//

import Foundation
import Result

public enum PagerError<ServiceError: Swift.Error>: Swift.Error {
    case service(ServiceError)
    case allLoaded
}

public protocol PagedService {
    associatedtype Model: Identifiable
    associatedtype Error: Swift.Error
    
    func fetchLoaded(_ completion: @escaping (Result<[Model], Error>) -> Void)
    func load(page: Int, _ completion: @escaping (Result<[Model], Error>) -> Void)
    func cancel()    
}

public protocol PagedServiceDelegate: class {
    func didRetrieveLimit(_ limit: Int)
}

public protocol Identifiable {
    associatedtype Identifier
}

public final class Pager<Service>
    where
    Service: PagedService
{
    public typealias Error = PagerError<Service.Error>
    public typealias Model = Service.Model
    
    var page: Int = 0
    let pageLimit: Int
    let service: Service
    
    public init(service: Service, pageLimit: Int) {
        self.service = service
        self.pageLimit = pageLimit
    }
    
    public func loadMore(_ completion: @escaping (Result<[Model], Error>) -> Void) {
        service.load(page: page) { [weak self] result in
            self?.process(result: result, completion: completion)
            if case .success = result {
                self?.page += 1
            }
        }
    }
    
    public func fetch(_ completion: @escaping (Result<[Model], Error>) -> Void) {
        service.fetchLoaded { [weak self] result in
            self?.process(result: result, completion: completion)
        }
    }
    
    private func process(
        result: Result<[Model], Service.Error>,
        completion: (Result<[Model], Error>) -> Void
        )
    {
        switch result {
        case .success(let model):
            completion(.success(model))
            if pageLimit > 0, model.count < pageLimit {
                completion(.failure(.allLoaded))
            }
        case .failure(let error):
            completion(.failure(.service(error)))
        }
    }
    
    deinit {
        service.cancel()
    }
    
}
