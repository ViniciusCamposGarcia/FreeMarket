//
//  ProductDetailViewController.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 04/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol ProductDetailPresentableListener: class {
    func viewDidLoad()
}

protocol ProductDetailControllable: class {
    func configure(with state: ProductDetailViewController.State)
}

protocol ProductDetailCellViewable {
    var type: AnyClass { get }
    func configured(cell: UITableViewCell, offsetControlProperty: ControlProperty<CGPoint>) -> UITableViewCell
    var reuseIdentifier: String { get }
}

extension ProductDetailCellViewable {
    var reuseIdentifier: String {
        return String(describing: type)
    }
}

class ProductDetailViewController: UIViewController {

    enum State {
        case show(productDetailCellViewables: [ProductDetailCellViewable])
    }
    
    //---------------------------------------------
    // MARK: - Outlets
    //---------------------------------------------
    
    @IBOutlet weak var tableView: UITableView!
    
    //---------------------------------------------
    // MARK: - Private propeties
    //---------------------------------------------
    
    private var listener: ProductDetailPresentableListener
    private var productDetailCellViewables: [ProductDetailCellViewable] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    //---------------------------------------------
    // MARK: - Initialization
    //---------------------------------------------
    
    init(listener: ProductDetailPresentableListener) {
        
        self.listener = listener
        super.init(nibName: String(describing: ProductDetailViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listener.viewDidLoad()
    }
}

//---------------------------------------------
// MARK: - ProductDetailControllable
//---------------------------------------------

extension ProductDetailViewController: ProductDetailControllable {
    
    func configure(with state: ProductDetailViewController.State) {
        switch state {
        case .show(let productDetailCellViewables):
            productDetailCellViewables.forEach {
                tableView.register(
                    UINib(nibName: String(describing: $0.type), bundle: nil),
                    forCellReuseIdentifier: $0.reuseIdentifier)
            }
            self.productDetailCellViewables = productDetailCellViewables
        }
    }
}

//---------------------------------------------
// MARK: - UITableViewDataSource
//---------------------------------------------

extension ProductDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productDetailCellViewables.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let productDetailCellViewable = productDetailCellViewables[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: productDetailCellViewable.reuseIdentifier) else {
            return UITableViewCell()
        }
        
        return productDetailCellViewable.configured(
            cell: cell,
            offsetControlProperty: tableView.rx.contentOffset.asControlProperty())
    }
}
