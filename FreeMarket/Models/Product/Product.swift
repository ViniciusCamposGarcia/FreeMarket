//
//  Product.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 06/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Product {
    
    let id: String
    let siteId: String
    let title: String
    let seller: Seller
    let price: Decimal
    let currencyId: String
    let availableQuantity: Int
    let sold_quantity: Int
    let buyingMode: String
    let listingTypeId: String
    let stopTime: Date?
    let condition: String
    let permalink: String
    let thumbnail: String
    let acceptsMercadopago: Bool
    let installments: Installments
    let address: Address
    let shipping: Shipping
    let sellerAddress: SellerAddress
    let attributes: [ProductAttributes]
    let originalPrice: Decimal?
    let categoryId: String
    let officialStoreId: String?
    let catalogProductId: String?
    let reviews: [String]?
    let tags: [String]
    
    init?(json: JSON) {
        
        guard
            let id = json["id"].string,
            let stopTime = Date.fromFormattedString(json["stop_time"].stringValue),
            let seller = Seller(json: json["seller"]),
            let sellerAddress = SellerAddress(json: json["sellerAddress"])
            else { return nil }
        
        self.id = id
        siteId = json["site_id"].stringValue
        title = json["title"].stringValue
        self.seller = seller
        price = json["price"].numberValue.decimalValue
        currencyId = json["currency_id"].stringValue
        availableQuantity = json["available_quantity"].intValue
        sold_quantity = json["sold_quantity"].intValue
        buyingMode = json["buying_mode"].stringValue
        listingTypeId = json["listing_type_id"].stringValue
        self.stopTime = stopTime
        condition = json["condition"].stringValue
        permalink = json["permalink"].stringValue
        thumbnail = json["thumbnail"].stringValue
        acceptsMercadopago = json["accepts_mercadopago"].boolValue
        installments = Installments(json: json["installments"])
        address = Address(json: json["address"])
        shipping = Shipping(json: json["shipping"])
        self.sellerAddress = sellerAddress
        attributes = json["attributes"].arrayValue.map(ProductAttributes.init)
        originalPrice = json["original_price"].number?.decimalValue
        categoryId = json["category_id"].stringValue
        officialStoreId = json["official_store_id"].string
        catalogProductId = json["catalog_product_id"].string
        reviews = json["reviews"].arrayValue.map { $0.stringValue }
        tags = json["tags"].arrayValue.map { $0.stringValue }
    }
}
