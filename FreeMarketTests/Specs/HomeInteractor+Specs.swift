//
//  HomeInteractor+Specs.swift
//  FreeMarketTests
//
//  Created by Vinicius Garcia on 11/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import FreeMarket

class HomeInteractorSpecs: QuickSpec {
    
    class HomeListenerSpy: HomeListener {
        var wasCalledWithOpenSearch = false
        func homeInteract(with event: HomeInteractor.Event) {
            wasCalledWithOpenSearch = event == .openSearch
        }
    }
    
    override func spec() {
        
        var homeListenerSpy: HomeListenerSpy!
        var homeInteractor: HomeInteractor!
        
        beforeEach {
            homeListenerSpy = HomeListenerSpy()
            homeInteractor = HomeInteractor(listener: homeListenerSpy)
        }
        
        fdescribe("HomeInteractor") {
            
            describe("didTapSearchButton()") {
                
                context("listener is set") {
                    
                    it("call homeInteract with .openSearch") {
                        
                        homeInteractor.didTapSearchButton()
                        expect(homeListenerSpy.wasCalledWithOpenSearch).to(beTrue())
                    }
                }
            }
        }
    }
}
