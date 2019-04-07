//
//  SellerAddress.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 07/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation
import SwiftyJSON

struct SellerAddress {
    
    let id: String
    let comment: String
    let addressLine: String
    let zipCode: String
    let country: AddressRegion
    let state: AddressRegion
    let city: AddressRegion
    let latitude: String
    let longitude: String
    
    init?(json: JSON) {
        
        guard
            let id = json["id"].string,
            let country = AddressRegion(json: json["country"]),
            let state = AddressRegion(json: json["state"]),
            let city = AddressRegion(json: json["city"])
            else { return nil }
        
        self.id = id
        comment = json["comment"].stringValue
        addressLine = json["address_line"].stringValue
        zipCode = json["zip_code"].stringValue
        self.country = country
        self.state = state
        self.city = city
        latitude = json["latitude"].stringValue
        longitude = json["longitude"].stringValue
    }
}
