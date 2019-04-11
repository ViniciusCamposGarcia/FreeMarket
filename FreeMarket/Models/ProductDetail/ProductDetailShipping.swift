//
//  Shipping.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 08/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//


import Foundation
import SwiftyJSON

struct ProductDetailShipping {
	
    var mode : String?
	var freeMethods : [FreeMethods]?
	var tags : [String]?
	var dimensions : String?
	var localPickUp : Bool?
	var freeShipping : Bool?
	var logisticType : String?
	var storePickUp : Bool?

	init(json: JSON) {
        mode = json["mode"].string
        freeMethods = json["free_methods"].arrayValue.map(FreeMethods.init)
        tags = json["tags"].arrayValue.compactMap { $0.string }
        dimensions = json["dimensions"].string
        localPickUp = json["local_pick_up"].bool
        freeShipping = json["free_shipping"].bool
        logisticType = json["logistic_type"].string
        storePickUp = json["store_pick_up"].bool
	}
}
