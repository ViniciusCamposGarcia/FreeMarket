//
//  Address.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 07/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Address {
    
    let stateId: String
    let stateName: String
    let cityId: String
    let cityName: String
    
    init(json: JSON) {
        
        stateId = json["state_id"].stringValue
        stateName = json["state_name"].stringValue
        cityId = json["city_id"].stringValue
        cityName = json["city_name"].stringValue
    }
}
