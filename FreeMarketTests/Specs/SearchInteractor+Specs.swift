//
//  SearchInteractor+Specs.swift
//  FreeMarketTests
//
//  Created by Vinicius Garcia on 11/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import FreeMarket

class SearchInteractorSpecs: QuickSpec {
    
    class SearchListenerSpy: SearchListener {
        
        var wasCalledWithSearch = false
        var wasCalledWithCancel = false
        
        func searchInteract(with event: SearchInteractor.Event) {
            switch event {
            case .cancel:
                wasCalledWithCancel = true
            case .search:
                wasCalledWithSearch = true
            }
        }
    }
    
    override func spec() {
        
        var searchListenerSpy: SearchListenerSpy!
        var searchInteractor: SearchInteractor!
        
        beforeEach {
            searchListenerSpy = SearchListenerSpy()
            searchInteractor = SearchInteractor(listener: searchListenerSpy)
        }
        
        fdescribe("SearchInteractor") {
            
            describe("didTapSearchButton()") {
                
                context("listener is set") {
                    
                    it("call homeInteract with .openSearch") {
                        
                        searchInteractor.didTapSeeResultsButton(query: "")
                        expect(searchListenerSpy.wasCalledWithSearch).to(beTrue())
                    }
                }
            }
            
            describe("didTapCancelButton()") {
                
                context("listener is set") {
                    
                    it("call homeInteract with .cancel") {
                        
                        searchInteractor.didTapCancelButton()
                        expect(searchListenerSpy.wasCalledWithCancel).to(beTrue())
                    }
                }
            }
        }
    }
}
