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
        priceString = "R$ \(product.price)"
        let isZeroRate = product.installments.rate == 0
        installmentsDescription = "\(product.installments.quantity)x R$ \(product.installments.amount) \(isZeroRate ? "sem juros" : "")"
        self.isZeroRate = isZeroRate
        freeShippingString = product.shipping.freeShipping ? "frete grátis" : nil
    }
}
