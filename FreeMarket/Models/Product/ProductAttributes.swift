//
//  ProductAttributes.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 07/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ProductAttributes {
    
    let attributeGroupId: String
    let attributeGroupName: String
    let source: String
    let id: String
    let name: String
    let valueId: Int
    let valueName: String
    let valueStruct: Any
    
    init(json: JSON) {
        
        attributeGroupId = json["attribute_group_id"].stringValue
        attributeGroupName = json["attribute_group_name"].stringValue
        source = json["source"].stringValue
        id = json["id"].stringValue
        name = json["name"].stringValue
        valueId = json["value_id"].intValue
        valueName = json["value_name"].stringValue
        valueStruct = json["value_struct"].stringValue
    }
}
