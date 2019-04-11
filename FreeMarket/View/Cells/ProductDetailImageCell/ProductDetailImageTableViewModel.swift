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
    
    func configured(cell: UITableViewCell) -> UITableViewCell {
        (cell as? ProductDetailImageTableViewCell)?.configure(viewModel: self)
        return cell
    }
    
    var type: AnyClass {
        return ProductDetailImageTableViewCell.self
    }
}

final class ProductDetailImageTableViewModel: ProductDetailCellViewable {
    
    let imageURLString: String
    
    init(imageURLString: String = "http://mlb-s1-p.mlstatic.com/513211-MLB20506483802_122015-I.jpg") {
        self.imageURLString = imageURLString
    }
}
