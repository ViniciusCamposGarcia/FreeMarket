//
//  Decimal+Extensions.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 09/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation

extension Decimal {
    
    var currencyString: String {
        
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.numberStyle = .currency
        return formatter.string(from: NSDecimalNumber(decimal: self)) ?? ""
    }
}
