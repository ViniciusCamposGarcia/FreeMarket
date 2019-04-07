//
//  ProductUseCases.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 06/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation

protocol ProductUsecasesProtocol {
    func products(query: String, completion: (_ products: [Product]) -> Void)
}

final class ProductUsecases: UseCases {

    func products(query: String, completion: (_ products: [Product]) -> Void) {
        
        networkRepository.request(endpoint: ProductEndpoint.search(query: query)) { result in
            
            result.analysis(ifSuccess: { value in
                
                
            
            }, ifFailure: { error in
                
            
            })
        }
    }
}
