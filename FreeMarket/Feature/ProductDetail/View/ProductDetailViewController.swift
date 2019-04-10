//
//  ProductDetailViewController.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 04/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import UIKit

protocol ProductDetailPresentableListener: class {
    func viewDidLoad()
    func didTapCell(itemId: String)
}

protocol ProductDetailControllable: class {
    func configure(with state: ProductListViewController.State)
}

class ProductDetailViewController: UIViewController {

    //---------------------------------------------
    // MARK: - Outlets
    //---------------------------------------------
    
    @IBOutlet weak var tableView: UITableView!
    
    //---------------------------------------------
    // MARK: - Private propeties
    //---------------------------------------------
    
    private var listener: ProductDetailPresentableListener
    private var productDetailCellViewables: [ProductDetailCellViewable] = []
    
    //---------------------------------------------
    // MARK: - Initialization
    //---------------------------------------------
    
    init(listener: ProductDetailPresentableListener) {
        
        self.listener = listener
        super.init(nibName: String(describing: ProductListViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        productDetailCellViewables.forEach {
            tableView.register(UINib(nibName: String(describing: $0.type), bundle: nil), forCellReuseIdentifier: $0.reuseIdentifier)
        }
        
        // Do any additional setup after loading the view.
    }
}

//---------------------------------------------
// MARK: - UITableViewDataSource
//---------------------------------------------

extension ProductDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let productDetailCellViewable = productDetailCellViewables[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: productDetailCellViewable.reuseIdentifier) else {
            return UITableViewCell()
        }
        
        productDetailCellViewable.configure(cell: cell)
    }
}

