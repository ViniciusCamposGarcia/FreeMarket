//
//  Pictures.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 08/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//


import Foundation
import SwiftyJSON

struct Pictures {
	
    var id : String?
	var url : String?
	var secureUrl : String?
	var size : String?
	var maxSize : String?
	var quality : String?

	init(json: JSON) {
        id = json["id"].string
        url = json["url"].string
        secureUrl = json["secure_url"].string
        size = json["size"].string
        maxSize = json["max_size"].string
        quality = json["quality"].string
	}
}
