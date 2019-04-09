//
//  ViewError.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 08/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation

enum ViewError: Error {
    
    case noInternetAccess
    case noData
    
    var errorTitle: String {
        
        switch self {
        case .noInternetAccess:
            return "check your internet connection and try again"
        case .noData:
            return "Nothing to show"
        }
    }
}
