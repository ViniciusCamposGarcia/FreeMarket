//
//  ProductUseCases.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 06/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation
import Result
import SwiftyJSON

protocol ProductUsecasesProtocol {
    func products(query: String, completion: (_ products: [Product]) -> Void)
}

final class ProductUsecases: UseCases {

    func products(query: String, completion: @escaping (_ products: Result<[Product], ViewError>) -> Void) {
        
        let adaptedQuery = query.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: " ", with: "_")
        
        networkRepository.request(endpoint: ProductEndpoint.search(query: adaptedQuery)) { result in
            
            result.analysis(ifSuccess: { value in
                
                let products = SearchResult(json: value).results
                
                guard !products.isEmpty else {
                    completion(.failure(.noData))
                    return
                }
                
                completion(.success(products))
            
            }, ifFailure: { error in
                
                switch error {
                case .noConnection:
                    completion(.failure(.noInternetAccess))
                }
            })
        }
    }
}
