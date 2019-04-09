//
//  SearchBuilder.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 07/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation
import UIKit

final class SearchBuilder {
    
    func build(with listener: SearchListener) -> UIViewController {
        
        let searchInteractor = SearchInteractor(listener: listener)
        let navigationController = UINavigationController()
        let searchViewController = SearchViewController(listener: searchInteractor)
        navigationController.setViewControllers([searchViewController], animated: false)
        navigationController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        return navigationController
    }
}
