//
//  UseCase.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 06/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation

class UseCases {
    
    var networkRepository: NetworkRepositoryProtocol {
        
        #if DEBUG
            return NetworkRepositoryAlamofireAdapter()
        #else
            return NetworkRepositoryAlamofireAdapter()
        #endif
    }
}
