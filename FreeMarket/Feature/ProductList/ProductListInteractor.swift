//
//  ProductListInteractor.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 08/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation

protocol ProductListListener: class {
    func productListInteract(with event: ProductListInteractor.Event)
}
    
final class ProductListInteractor {
    
    enum Event {
        case showProduct(id: String)
    }
    
    //---------------------------------------------
    // MARK: - Private properties
    //---------------------------------------------
    
    private weak var listener: ProductListListener?
    private weak var productUseCases: ProductUsecases?
    private var query: String
    
    //---------------------------------------------
    // MARK: - Public properties
    //---------------------------------------------
    
    weak var productListControllable: ProductListControllable?
    
    //---------------------------------------------
    // MARK: - Initialization
    //---------------------------------------------
    
    init(listener: ProductListListener, productUseCases: ProductUsecases, query: String) {
        self.listener = listener
        self.productUseCases = productUseCases
        self.query = query
    }
}

extension ProductListInteractor: ProductListPresentableListener {
    
    func viewDidLoad() {
        
        self.productListControllable?.configure(with: .loading(title: query))
        
        productUseCases?.products(query: query) { result in
            
            result.analysis(ifSuccess: { products in
                
                self.productListControllable?.configure(
                    with: .showResults(cellViewModels: products.compactMap(ProductCellViewModel.init)))
            
            }, ifFailure: { error in
                
                self.productListControllable?.configure(with: .error(viewError: error))
            })
        }
    }
    
    func didTapCell(itemId: String) {
        listener?.productListInteract(with: .showProduct(id: itemId))
    }
}
