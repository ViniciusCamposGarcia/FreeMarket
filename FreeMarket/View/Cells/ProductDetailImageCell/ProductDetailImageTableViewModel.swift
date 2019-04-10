//
//  ProductDetailImageTableViewModel.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 10/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation
import UIKit

extension ProductDetailCellViewable where Self: ProductDetailImageTableViewModel {
    
    func configure(cell: UITableViewCell) {
        (cell as? ProductDetailImageTableViewCell)?.configure(viewModel: self)
    }
}

final class ProductDetailImageTableViewModel: ProductDetailCellViewable {
    
    var type: AnyClass {
        return ProductDetailImageTableViewCell.self
    }
    
    var reuseIdentifier: String {
        return "ProductDetailImageTableViewCellIdentifier"
    }
    
    init() {
        
    }
}
