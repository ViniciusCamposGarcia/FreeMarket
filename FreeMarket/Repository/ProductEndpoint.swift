//
//  APIRouter.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 06/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation


enum APIRouterError: Error {
    
    case jsonEncodingFailed
}

enum ProductEndpoint: EndpointProtocol {
    
    case search(query: String)
    case detail(productId: Int)
    
    var method: NetworkHttpMethod {
        switch self {
        case .search:
            return .get
        case .detail:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .search(let query):
            return "/sites/MLB/search?q=\(query)"
        case .detail(let productId):
            return "/items/\(productId)"
        }
    }
    
    var parameters: NetworkParameters? {
        return nil
    }
    
    var headers: NetworkHeaders? {
        return nil
    }
    
    func urlString() -> String {
        return NetworkEndpoint.ProductionServer.baseURLString.appending(path)
    }
}
