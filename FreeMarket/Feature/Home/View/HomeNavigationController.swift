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
    // MARK: - Initialization
    //-----------------------------------------------------------------------------
    
    init() {
        super.init(nibName: nil, bundle: nil)
        modalTransitionStyle = .crossDissolve
    }
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        modalTransitionStyle = .crossDissolve
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        modalTransitionStyle = .crossDissolve
    }
    
    //-----------------------------------------------------------------------------
    // MARK: - View lifecycle
    //-----------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.tintColor = .black
        self.navigationBar.barTintColor = .mainYellow
        self.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        self.navigationBar.isTranslucent = false
        self.delegate = self
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
