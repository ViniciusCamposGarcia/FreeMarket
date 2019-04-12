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

protocol ProductUsecasesProtocol: class {
    func products(query: String,
                  completion: @escaping (_ result: Result<[Product], ViewError>) -> Void)
    func product(id: String,
                 completion: @escaping (_ result: Result<ProductDetail, ViewError>) -> Void)
}

final class ProductUsecases: UseCases, ProductUsecasesProtocol {

    func products(query: String, completion: @escaping (_ result: Result<[Product], ViewError>) -> Void) {
        
        let trimmedQuery = query.trimmingCharacters(in: .whitespacesAndNewlines)
        let adaptedQuery = trimmedQuery.replacingOccurrences(of: " ", with: "_")
        let searchQuery = adaptedQuery.folding(options: .diacriticInsensitive, locale: .current)
        
        networkRepository.request(endpoint: ProductEndpoint.search(query: searchQuery)) { result in
            
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
    
    func product(id: String, completion: @escaping (_ result: Result<ProductDetail, ViewError>) -> Void) {
        
        let trimmedId = id.trimmingCharacters(in: .whitespacesAndNewlines)
        
        networkRepository.request(endpoint: ProductEndpoint.detail(productId: trimmedId)) { result in
            
            result.analysis(ifSuccess: { value in
                
                guard let product = ProductDetail(json: value) else {
                    completion(.failure(.noData))
                    return
                }
                
                completion(.success(product))
                
            }, ifFailure: { error in
                
                switch error {
                case .noConnection:
                    completion(.failure(.noInternetAccess))
                }
            })
        }
    }
}
