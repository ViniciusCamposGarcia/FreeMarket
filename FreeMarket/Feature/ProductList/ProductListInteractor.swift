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
    private weak var productUseCases: ProductUsecasesProtocol?
    private var query: String
    
    //---------------------------------------------
    // MARK: - Public properties
    //---------------------------------------------
    
    weak var productListControllable: ProductListControllable?
    
    //---------------------------------------------
    // MARK: - Initialization
    //---------------------------------------------
    
    init(listener: ProductListListener, productUseCases: ProductUsecasesProtocol, query: String) {
        self.listener = listener
        self.productUseCases = productUseCases
        self.query = query
    }
    
    //---------------------------------------------
    // MARK: - Private methods
    //---------------------------------------------
    
    private func load() {
        
        self.productListControllable?.configure(with: .loading)
        
        productUseCases?.products(query: query) { result in
            
            result.analysis(ifSuccess: { products in
                
                self.productListControllable?.configure(
                    with: .showResults(cellViewModels: products.compactMap(ProductCellViewModel.init)))
                
            }, ifFailure: { error in
                
                self.productListControllable?.configure(with: .error(viewError: error))
            })
        }
    }
}

//---------------------------------------------
// MARK: - ProductListPresentableListener
//---------------------------------------------

extension ProductListInteractor: ProductListPresentableListener {
    
    func didTapRetry() {
        load()
    }
    
    func viewDidLoad() {
        load()
    }
    
    func didTapCell(itemId: String) {
        listener?.productListInteract(with: .showProduct(id: itemId))
    }
}
