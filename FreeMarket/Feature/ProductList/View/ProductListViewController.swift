//
//  ProductListViewController.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 04/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import UIKit
import Lottie

protocol ProductListPresentableListener: class {
    func viewDidLoad()
    func didTapCell(itemId: String)
    func didTapRetry()
}

protocol ProductListControllable: class {
    func configure(with state: ProductListViewController.State)
}

class ProductListViewController: UIViewController {
    
    enum State {
        case loading
        case error(viewError: ViewError)
        case showResults(cellViewModels: [ProductCellViewModel])
    }
    
    //---------------------------------------------
    // MARK: - Outlets
    //---------------------------------------------

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var animationView: AnimationView! {
        didSet {
            let starAnimation = Animation.named("loading")
            animationView.animation = starAnimation
            animationView.loopMode = .loop
            animationView.play()
        }
    }
    
    //---------------------------------------------
    // MARK: - Private propeties
    //---------------------------------------------
    
    private var listener: ProductListPresentableListener
    
    private var state: State? {
        didSet {
            configureForState()
        }
    }
    var cellViewModels: [ProductCellViewModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    private let cellReuseIdentifier = "ProductCellIdentifier"
    
    //---------------------------------------------
    // MARK: - Initialization
    //---------------------------------------------
    
    init(listener: ProductListPresentableListener) {
        
        self.listener = listener
        super.init(nibName: String(describing: ProductListViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //---------------------------------------------
    // MARK: - View lifecycle
    //---------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(
            UINib(nibName: "ProductTableViewCell", bundle: nil),
            forCellReuseIdentifier: cellReuseIdentifier)
        
        configureForState()
        listener.viewDidLoad()
    }
}

//---------------------------------------------
// MARK: - Private methods
//---------------------------------------------

extension ProductListViewController {
    private func configureForState() {
        switch state {
        case .loading?:
            
            tableView.fadeOut(completion: nil)
            animationView.fadeIn(completion: nil)
            
        case .error(let viewError)?:
            
            animationView.fadeOut {
                self.animationView.stop()
            }
            
            presentAlert(with: viewError) {
                self.listener.didTapRetry()
            }
            
        case .showResults(let cellViewModels)?:
            
            animationView.fadeOut {
                self.animationView.stop()
            }
            
            tableView.fadeIn(completion: nil)
            self.cellViewModels = cellViewModels
        
        case .none:
            break
        }
    }
}

//---------------------------------------------
// MARK: - ProductListControllable
//---------------------------------------------

extension ProductListViewController: ProductListControllable {
    func configure(with state: ProductListViewController.State) {
        self.state = state
    }
}

//---------------------------------------------
// MARK: - UITableViewDelegate
//---------------------------------------------

extension ProductListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        listener.didTapCell(itemId: cellViewModels[indexPath.row].id)
    }
}

//---------------------------------------------
// MARK: - UITableViewDelegate
//---------------------------------------------

extension ProductListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: cellReuseIdentifier) as? ProductTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: cellViewModels[indexPath.row])
        return cell
    }
}
