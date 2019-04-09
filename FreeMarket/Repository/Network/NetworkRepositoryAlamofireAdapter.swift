//
//  NetworkRepositoryAdapter.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 06/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation
import Alamofire
import Result
import SwiftyJSON

class NetworkRepositoryAlamofireAdapter: NetworkRepositoryProtocol{
    func request(endpoint: EndpointProtocol, completion: @escaping (NetworkResult<JSON, NetworkError>) -> Void) {
        
        print(
            """
                -----------REQUEST-----------
                \(endpoint.urlString())
                -----------------------------
            """
        )
        
        Alamofire.request(endpoint.urlString(),
                          method: httpMethodAdapted(endpoint.method),
                          parameters: endpoint.parameters,
                          encoding: JSONEncoding.default,
                          headers: endpoint.headers).responseJSON { response in
                            
                            switch response.result {
                                
                            case .success(let value):
                                
                                let jsonValue = JSON(value)
                                
                                print(
                                    """
                                    -----------RESPONSE-----------
                                    \(jsonValue)
                                    -----------------------------
                                    """
                                )
                                
                                completion(.success(jsonValue))
                            case .failure:
                                completion(.failure(.noConnection))
                            }
        }
    }

    
    //---------------------------------------------
    // MARK: - Private methods
    //---------------------------------------------
    
    private func httpMethodAdapted(_ method: NetworkHttpMethod) -> HTTPMethod {
        
        switch method {
        case .options:
            return .options
        case .get:
            return .get
        case .head:
            return .head
        case .post:
            return .post
        case .put:
            return .put
        case .patch:
            return .patch
        case .delete:
            return .delete
        case .trace:
            return .trace
        case .connect:
            return .connect
        }
    }
}
