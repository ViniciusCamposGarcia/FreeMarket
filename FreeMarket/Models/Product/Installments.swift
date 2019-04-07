//
//  Installments.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 07/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Installments {
    
    let quantity: Int
    let amount: Decimal
    let rate: Decimal
    let currencId: String
    
    init(json: JSON) {
        
        quantity = json["quantity"].intValue
        amount = json["amount"].numberValue.decimalValue
        rate = json["rate"].numberValue.decimalValue
        currencId = json["currencId"].stringValue
    }
}
