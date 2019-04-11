//
//  SellerAddress.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 08/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ProductDetailSellerAddress {
	
    var comment : String?
	var addressLine : String?
	var zipCode : String?
	var city : AddressRegion?
	var state : AddressRegion?
	var country : AddressRegion?
	var latitude : Double?
	var longitude : Double?
	var id : Int?

	init(json: JSON) {
        comment = json["comment"].string
        addressLine = json["address_line"].string
        zipCode = json["zip_code"].string
        city = AddressRegion(json: json["city"])
        state = AddressRegion(json: json["state"])
        country = AddressRegion(json: json["country"])
        latitude = json["latitude"].double
        longitude = json["longitude"].double
        id = json["id"].int
	}
}
