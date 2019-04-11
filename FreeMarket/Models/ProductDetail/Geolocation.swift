//
//  Geolocation.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 08/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Geolocation {
	
    var latitude : Double?
	var longitude : Double?

	init(json: JSON) {
        latitude = json["latitude"].double
        longitude = json["longitude"].double
	}
}
