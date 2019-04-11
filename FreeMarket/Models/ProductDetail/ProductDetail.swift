//
//  ProductDetail.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 08/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ProductDetail {
	var id : String?
	var site_id : String?
	var title : String?
	var subtitle : String?
	var seller_id : Int?
	var category_id : String?
	var official_store_id : Int?
	var price : Double?
	var base_price : Double?
	var original_price : String?
	var currency_id : String?
	var initial_quantity : Int?
	var available_quantity : Int?
	var sold_quantity : Int?
	var sale_terms : [String]?
	var buying_mode : String?
	var listing_type_id : String?
	var start_time : String?
	var stop_time : String?
	var condition : String?
	var permalink : String?
	var thumbnail : String?
	var secure_thumbnail : String?
	var pictures : [Pictures]?
	var video_id : String?
	var accepts_mercadopago : Bool?
	var non_mercado_pago_payment_methods : [String]?
	var shipping : ProductDetailShipping?
	var international_delivery_mode : String?
	var seller_address : ProductDetailSellerAddress?
	var seller_contact : String?
	var location : AddressRegion?
	var geolocation : Geolocation?
	var coverage_areas : [String]?
	var attributes : [ProductAttributes]?
	var warnings : [String]?
	var listing_source : String?
	var status : String?
	var sub_status : [String]?
	var tags : [String]?
	var warranty : String?
	var catalog_product_id : String?
	var domain_id : String?
	var parent_item_id : String?
	var differential_pricing : String?
	var deal_ids : [String]?
	var automatic_relist : Bool?
	var date_created : String?
	var last_updated : String?
	var health : Int?

	init?(json: JSON) {
        
        guard let id = json["id"].string else {
            return nil
        }
        
        self.id = id
        site_id = json["site_id"].string
        title = json["title"].string
        subtitle = json["subtitle"].string
        seller_id = json["seller_id"].int
        category_id = json["category_id"].string
        official_store_id = json["official_store_id"].int
        price = json["price"].double
        base_price = json["base_price"].double
        original_price = json["original_price"].string
        currency_id = json["currency_id"].string
        initial_quantity = json["initial_quantity"].int
        available_quantity = json["available_quantity"].int
        sold_quantity = json["sold_quantity"].int
        sale_terms = json["sale_terms"].arrayValue.compactMap { $0.string }
        buying_mode = json["buying_mode"].string
        listing_type_id = json["listing_type_id"].string
        start_time = json["start_time"].string
        stop_time = json["stop_time"].string
        condition = json["condition"].string
        permalink = json["permalink"].string
        thumbnail = json["thumbnail"].string
        secure_thumbnail = json["secure_thumbnail"].string
        pictures = json["pictures"].arrayValue.map(Pictures.init)
        video_id = json["video_id"].string
        accepts_mercadopago = json["accepts_mercadopago"].bool
        non_mercado_pago_payment_methods = json["non_mercado_pago_payment_methods"].arrayValue.compactMap { $0.string }
        shipping = ProductDetailShipping(json: json["shipping"])
        international_delivery_mode = json["international_delivery_mode"].string
        seller_address = ProductDetailSellerAddress(json: json["seller_address"])
        seller_contact = json["seller_contact"].string
        location = AddressRegion(json: json["location"])
        geolocation = Geolocation(json: json["geolocation"])
        coverage_areas = json["coverage_areas"].arrayValue.compactMap { $0.string }
        attributes = json["attributes"].arrayValue.map(ProductAttributes.init)
        warnings = json["warnings"].arrayValue.compactMap { $0.string }
        listing_source = json["listing_source"].string
        status = json["status"].string
        sub_status = json["sub_status"].arrayValue.compactMap { $0.string }
        tags = json["tags"].arrayValue.compactMap { $0.string }
        warranty = json["warranty"].string
        catalog_product_id = json["catalog_product_id"].string
        domain_id = json["domain_id"].string
        parent_item_id = json["parent_item_id"].string
        differential_pricing = json["differential_pricing"].string
        deal_ids = json["deal_ids"].arrayValue.compactMap { $0.string }
        automatic_relist = json["automatic_relist"].bool
        date_created = json["date_created"].string
        last_updated = json["last_updated"].string
        health = json["health"].int
	}
}
