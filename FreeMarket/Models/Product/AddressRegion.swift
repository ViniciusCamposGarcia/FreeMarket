//
//  AddressRegion.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 07/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation
import SwiftyJSON

struct AddressRegion {
    
    let id: String
    let name: String
    
    init?(json: JSON) {
        
        guard let id = json["id"].string else {
            return nil
        }
        
        self.id = id
        name = json["name"].stringValue
    }
}
