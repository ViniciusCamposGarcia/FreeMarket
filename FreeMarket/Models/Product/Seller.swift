//
//  Seller.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 07/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Seller {
    
    let id: Int
    let powerSellerStatus: Any
    let carDealer: Bool
    let realEstateAgency: Bool
    let tags: [String]
    
    init?(json: JSON) {
        
        guard let id = json["id"].int else {
            return nil
        }
        self.id = id
        powerSellerStatus = 1
        carDealer = json["car_dealer"].boolValue
        realEstateAgency = json["real_estate_agency"].boolValue
        tags = json["tags"].arrayValue.map { $0.stringValue }
    }
}
