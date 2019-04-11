//
//  ProductCellViewModel.swift
//  FreeMarketUI
//
//  Created by Vinicius Campos Garcia on 07/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation

final class ProductCellViewModel {
    
    let id: String
    let imageURLString: String
    let title: String
    let priceString: String
    let installmentsDescription: String
    let freeShippingString: String?
    let isZeroRate: Bool
    
    init(product: Product) {
     
        id = product.id
        imageURLString = product.thumbnail
        title = product.title
        priceString = product.price.currencyString
        
        let isZeroRate = product.installments.rate == 0
        self.isZeroRate = isZeroRate
        
        freeShippingString = product.shipping.freeShipping ? "frete grátis" : nil
        
        let quantity = product.installments.quantity
        let currencyString = product.installments.amount.currencyString
        let rateString = isZeroRate ? "sem juros" : ""
        
        installmentsDescription = "\(quantity)x \(currencyString) \(rateString)"
    }
}
