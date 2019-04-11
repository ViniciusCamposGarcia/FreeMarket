//
//  AppCoordinator.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 04/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation
import UIKit

protocol CoordinatorProtocol {
    
    func initialViewController() -> UIViewController
    func start()
}

final class AppCoordinator {

    //---------------------------------------------
    // MARK: - Private properties
    //---------------------------------------------
    
    private let window: UIWindow
    private var navigationController: HomeNavigationController
    private lazy var homeCoordinator = HomeCoordinator(presenter: navigationController)
    
    //---------------------------------------------
    // MARK: - Initialization
    //---------------------------------------------
    
    init(window: UIWindow) {
        self.window = window
        navigationController = HomeNavigationController()
    }
}

//---------------------------------------------
// MARK: - CoordinatorProtocol
//---------------------------------------------

extension AppCoordinator: CoordinatorProtocol {
 
    func initialViewController() -> UIViewController {
        return window.rootViewController ?? navigationController
    }
    
    func start() {
        window.rootViewController = initialViewController()
        window.makeKeyAndVisible()
        homeCoordinator.start()
    }
}
