//
//  NetworkRepository.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 06/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation
import Result
import SwiftyJSON

public enum NetworkHttpMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

public typealias NetworkResult = Result

public typealias NetworkParameters = [String: Any]

public typealias NetworkHeaders = [String: String]

protocol NetworkRepositoryProtocol {
    func request(endpoint: EndpointProtocol, completion: @escaping (NetworkResult<JSON, NetworkError>) -> Void)
}

public enum NetworkError: Error {
    case noConnection
}
