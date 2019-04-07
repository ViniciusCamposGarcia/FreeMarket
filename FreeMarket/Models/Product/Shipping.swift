//
//  Shipping.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 07/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Shipping {
    
    let freeShipping: Bool
    let mode: String
    let tags: [String]
    let logisticType: String
    let storePickUp: Bool
    
    init(json: JSON) {
        
        freeShipping = json["free_shipping"].boolValue
        mode = json["mode"].stringValue
        tags = json["tags"].arrayValue.map { $0.stringValue }
        logisticType = json["logistic_type"].stringValue
        storePickUp = json["store_pick_up"].boolValue
    }
}
