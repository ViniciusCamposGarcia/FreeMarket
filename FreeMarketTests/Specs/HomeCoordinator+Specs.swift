//
//  HomeCoordinator+Specs.swift
//  FreeMarketTests
//
//  Created by Vinicius Garcia on 11/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import FreeMarket

class HomeCoordinatorSpecs: QuickSpec {
    
    override func spec() {
        
        var navigationController: UINavigationController!
        var homeCoordinator: HomeCoordinator!
        
        beforeEach {
            navigationController = UINavigationController()
            homeCoordinator = HomeCoordinator(presenter: navigationController)
        }
        
        fdescribe("HomeCoordinator") {
            
            describe("start()") {
                
                context("initialization") {
                    
                    it("increase navigationController.viewControllers stack") {
                        
                        let vcsCount = navigationController.viewControllers.count
                        homeCoordinator.start()
                        let vcsCountBeforeStart = navigationController.viewControllers.count
                        
                        expect(vcsCount).to(beLessThan(vcsCountBeforeStart))
                    }
                }
            }
        }
    }
}
