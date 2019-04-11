//
//  HomeBuilder.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 10/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation
import UIKit

final class ProductDetailBuilder {
    
    func build(withProductUseCases: ProductUsecases, productId: String) -> UIViewController {
        
        let productDetailInteractor = ProductDetailInteractor(productUseCases: withProductUseCases,
                                                            productId: productId)
        let productDetailViewController = ProductDetailViewController(listener: productDetailInteractor)
        productDetailInteractor.productDetailControllable = productDetailViewController
        return productDetailViewController
    }
}
