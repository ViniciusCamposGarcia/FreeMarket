//
//  SearchResult.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 08/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation
import SwiftyJSON

struct SearchResult {
    
    let siteId: String
    let query: String
    let paging: SearchResultPaging
    let results: [Product]
    
    init(json: JSON) {
        
        siteId = json["site_id"].stringValue
        query = json["query"].stringValue
        paging = SearchResultPaging(json: json["paging"])
        results = json["results"].arrayValue.compactMap(Product.init)
    }
}

struct SearchResultPaging {
    
    let total: Int
    let offset: Int
    let limit: Int
    let primaryResults: Int
    
    init(json: JSON) {
        
        total = json["total"].intValue
        offset = json["offset"].intValue
        limit = json["total"].intValue
        primaryResults = json["primary_results"].intValue
    }
}
