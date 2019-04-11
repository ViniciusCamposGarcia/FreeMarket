//
//  FreeMethods.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 08/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation
import SwiftyJSON

struct FreeMethods {
	var id : Int?
	var rule : Rule?

	init(json: JSON) {
        id = json["id"].int
        rule = Rule(json: json["rule"])
	}
}
