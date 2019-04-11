//
//  Rule.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 08/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//


import Foundation
import SwiftyJSON

struct Rule {
	
    var freeMode : String?
	var value : String?

	init(json: JSON) {
        
        freeMode = json["free_mode"].string
        value = json["value"].string
	}
}
