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
        let searchViewController = SearchViewController(listener: searchInteractor)
        let navigationController = HomeNavigationController(
            rootViewController: searchViewController
        )
        return navigationController
    }
}
