//
//  NetworkEndpoint.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 06/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation

struct NetworkEndpoint {
    struct ProductionServer {
        static let baseURLString = "https://api.mercadolibre.com"
    }
}

protocol EndpointProtocol {
    var method: NetworkHttpMethod { get }
    var parameters: NetworkParameters? { get }
    var headers: NetworkHeaders? { get }
    func urlString() -> String
}

extension EndpointProtocol {
    var parameters: NetworkParameters? {
        return nil
    }
    
    var headers: NetworkHeaders? {
        return nil
    }
}
