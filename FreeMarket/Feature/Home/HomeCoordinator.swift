//
//  HomeCoordinator.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 06/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation
import UIKit

final class HomeCoordinator {
    
    //---------------------------------------------
    // MARK: - Private properties
    //---------------------------------------------
    
    private let presenter: UINavigationController
    
    //---------------------------------------------
    // MARK: - Initialization
    //---------------------------------------------
    
    init(presenter: UINavigationController){
        self.presenter = presenter
    }
}

//---------------------------------------------
// MARK: - CoordinatorProtocol
//---------------------------------------------


extension HomeCoordinator: CoordinatorProtocol {
    
    
    func initialViewController() -> UIViewController {
        return HomeBuilder().build(with: self)
    }
    
    func start() {
        presenter.pushViewController(initialViewController(), animated: true)
    }
}

//---------------------------------------------
// MARK: - HomeListener
//---------------------------------------------


extension HomeCoordinator: HomeListener {
    
    func homeInteract(with event: HomeInteractor.Event) {
        switch event {
        case .openSearch:
            
            let searchViewController = SearchBuilder().build(with: self)
            self.presenter.present(searchViewController, animated: true, completion: nil)
        }
    }
}

//---------------------------------------------
// MARK: - SearchListener
//---------------------------------------------

extension HomeCoordinator: SearchListener {

    func searchInteract(with event: SearchInteractor.Event) {
        switch event {
        case .search(let query):
            break
        }
    }
}
