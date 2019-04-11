//
//  HomeNavigationController.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 08/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import UIKit

class HomeNavigationController: UINavigationController, UINavigationControllerDelegate {

    //-----------------------------------------------------------------------------
    // MARK: - View lifecycle
    //-----------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modalTransitionStyle = .crossDissolve
        navigationBar.tintColor = .black
        navigationBar.barTintColor = .mainYellow
        navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        navigationBar.isTranslucent = false
        delegate = self
    }
    
    //-----------------------------------------------------------------------------
    // MARK: - Delegate
    //-----------------------------------------------------------------------------
    
    func navigationController(_ navigationController: UINavigationController,
                              willShow viewController: UIViewController,
                              animated: Bool) {
        
        let item = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        viewController.navigationItem.backBarButtonItem = item
    }
}
