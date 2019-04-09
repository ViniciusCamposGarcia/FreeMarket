//
//  ProductListBuilder.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 08/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation
import UIKit

final class ProductListBuilder {
    
    func build(with listener: ProductListListener,
               productUseCases: ProductUsecases,
               query: String) -> UIViewController {
        
        let productListInteractor = ProductListInteractor(listener: listener, productUseCases: productUseCases, query: query)
        let productListViewController = ProductListViewController(listener: productListInteractor)
        productListInteractor.productListControllable = productListViewController
        return productListViewController
    }
}
