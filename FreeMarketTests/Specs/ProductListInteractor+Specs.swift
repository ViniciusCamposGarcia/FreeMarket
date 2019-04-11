//
//  ProductListInteractor+Specs.swift
//  FreeMarketTests
//
//  Created by Vinicius Garcia on 11/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Result

@testable import FreeMarket

class ProductListInteractorSpecs: QuickSpec {
    
    class ProductListListenerSpy: ProductListListener {
        
        var lastShowProductId: String?
        
        func productListInteract(with event: ProductListInteractor.Event) {
            if case .showProduct(let id) = event {
                lastShowProductId = id
            }
        }
    }
    
    class ProductUsecasesSpy: ProductUsecasesProtocol {
        
        var lastRequestedQuery: String?
        var lastRequestedId: String?
        
        func products(query: String, completion: @escaping (Result<[Product], ViewError>) -> Void) {
            lastRequestedQuery = query
        }
        
        func product(id: String, completion: @escaping (Result<ProductDetail, ViewError>) -> Void) {
            lastRequestedId = id
        }
    }
    
    override func spec() {
        
        var productUseCaseSpy: ProductUsecasesSpy!
        var productListListenerSpy: ProductListListenerSpy!
        var productListInteractor: ProductListInteractor!
        let query: String = "gol"
        
        beforeEach {
            productUseCaseSpy = ProductUsecasesSpy()
            productListListenerSpy = ProductListListenerSpy()
            productListInteractor = ProductListInteractor(
                listener: productListListenerSpy,
                productUseCases: productUseCaseSpy,
                query: query)
        }
        
        fdescribe("ProductListInteractor") {
            
            describe("viewDidLoad()") {
                
                context("productUseCases is set") {
                    
                    it("products(query: String, ... with `query` parameter") {
                        
                        productListInteractor.viewDidLoad()
                        
                        expect(productUseCaseSpy.lastRequestedQuery) == query
                    }
                }
            }
            
            describe("didTapCell(itemId: String)") {
                
                context("listener is set") {
                    
                    it("call homeInteract showProduct with same id") {
                        
                        let itemID = "MLB76387HVJ"
                        productListInteractor.didTapCell(itemId: itemID)
                        
                        expect(productListListenerSpy.lastShowProductId) == itemID
                    }
                }
            }
        }
    }
}
