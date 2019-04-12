//
//  UIView+Extensions+Specs.swift
//  FreeMarketTests
//
//  Created by Vinicius Campos Garcia on 11/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import FreeMarket

class UIViewSpec: QuickSpec {
    
    override func spec() {
        
        fdescribe("UIView+Specs") {
            
            describe("fadeIn") {
                
                context("alpha manipulation") {
                    
                    it("set alpha as 1 at completion") {
                        
                        let view = UIView()
                        view.alpha = 0
                        
                        waitUntil { done in
                            view.fadeIn {
                                
                                expect(view.alpha) == 1
                                done()
                            }
                        }
                    }
                }
            }
            
            describe("fadeOut") {
                
                context("alpha manipulation") {
                    
                    it("set alpha as 0 at completion") {
                        
                        let view = UIView()
                        view.alpha = 1
                        
                        waitUntil { done in
                            view.fadeOut {
                                
                                expect(view.alpha) == 0
                                done()
                            }
                        }
                    }
                }
            }
        }
    }
}
