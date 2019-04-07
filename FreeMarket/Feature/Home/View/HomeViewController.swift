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

        // Do any additional setup after loading the view.
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
    
    //---------------------------------------------
    // MARK: - Actions
    //---------------------------------------------

    @IBAction func searchButtonTap() {
        listener.didTapSearchButton()
    }
}
