//
//  HomeViewController.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 04/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import UIKit

protocol HomePresentableListener {
    func didTapSearchButton()
}

class HomeViewController: UIViewController {

    //---------------------------------------------
    // MARK: - Private properties
    //---------------------------------------------
    
    let listener: HomePresentableListener
    
    //---------------------------------------------
    // MARK: - View lifecycle
    //---------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navigationBarDummyView = NavigationBarDummyView(frame: .zero)
        navigationBarDummyView.delegate = self
        navigationController?.navigationBar.topItem?.titleView = navigationBarDummyView
    }
    
    //---------------------------------------------
    // MARK: - Initialization
    //---------------------------------------------
    
    init(listener: HomePresentableListener) {
        self.listener = listener
        super.init(nibName: String(describing: HomeViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeViewController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController,
                              willShow viewController: UIViewController,
                              animated: Bool) {
        
        let item = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        viewController.navigationItem.backBarButtonItem = item
    }
}

extension HomeViewController: NavigationBarDummyViewDelegate {
    func searchCartViewSearchTap() {
        listener.didTapSearchButton()
    }
    
    func searchCartViewCartTap() {
        //TODO not implemented
    }
}
