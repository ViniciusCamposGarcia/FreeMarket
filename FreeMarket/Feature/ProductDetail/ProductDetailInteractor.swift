//
//  ProductListInteractor.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 08/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation

final class ProductDetailInteractor {
    
    //---------------------------------------------
    // MARK: - Private properties
    //---------------------------------------------
    
    private weak var productUseCases: ProductUsecases?
    private var productId: String
    
    //---------------------------------------------
    // MARK: - Public properties
    //---------------------------------------------
    
    weak var productDetailControllable: ProductDetailControllable?
    
    //---------------------------------------------
    // MARK: - Initialization
    //---------------------------------------------
    
    init(productUseCases: ProductUsecases, productId: String) {
        self.productUseCases = productUseCases
        self.productId = productId
    }
}

extension ProductDetailInteractor: ProductDetailPresentableListener {
    func viewDidLoad() {
        productUseCases?.product(id: productId, completion: { result in
            
            result.analysis(ifSuccess: { product in
                
                let imageViewModel = ProductDetailImageCellViewModel(productDetail: product)
                let titleViewModel = ProductDetailTitleCellViewModel(productDetail: product)
                
                self.productDetailControllable?.configure(
                    with: ProductDetailViewController.State.show(
                        productDetailCellViewables: [imageViewModel, titleViewModel]))
                
            }, ifFailure: { _ in
            
            })
        })
    }
}
