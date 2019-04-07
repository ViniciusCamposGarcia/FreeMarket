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
    private let appDependencyContainer: AppDependencyContainer
    private let navigationController: UINavigationController
    
    private lazy var homeCoordinator: CoordinatorProtocol = HomeCoordinator(presenter: navigationController)
    
    //---------------------------------------------
    // MARK: - Initialization
    //---------------------------------------------
    
    init(window: UIWindow) {
        self.window = window
        appDependencyContainer = AppDependencyContainer()
        navigationController = UINavigationController()
        navigationController.isNavigationBarHidden = true
    }
}

//---------------------------------------------
// MARK: - Public methods
//---------------------------------------------

extension AppCoordinator: CoordinatorProtocol  {
 
    func initialViewController() -> UIViewController {
        return window.rootViewController ?? navigationController
    }
    
    func start() {
        window.rootViewController = initialViewController()
        window.makeKeyAndVisible()
        
        homeCoordinator.start()
    }
}
