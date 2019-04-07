//
//  SearchViewController.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 07/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import UIKit

protocol SearchPresentableListener {
    func didTapSeeResultsButton(query: String)
}

class SearchViewController: UIViewController {

    //---------------------------------------------
    // MARK: - Private properties
    //---------------------------------------------
    
    let listener: SearchPresentableListener
    
    //---------------------------------------------
    // MARK: - Initialization
    //---------------------------------------------
    
    init(listener: SearchPresentableListener) {
        self.listener = listener
        super.init(nibName: String(describing: SearchViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //---------------------------------------------
    // MARK: - View lifecycle
    //---------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}
