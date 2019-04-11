//
//  ProductDetailTitleTableViewModel.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 11/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

extension ProductDetailCellViewable where Self: ProductDetailTitleCellViewModel {
    
    func configured(cell: UITableViewCell,
                    offsetControlProperty: ControlProperty<CGPoint>) -> UITableViewCell {
        
        (cell as? ProductDetailTitleTableViewCell)?.configure(viewModel: self)
        return cell
    }
    
    var type: AnyClass {
        return ProductDetailTitleTableViewCell.self
    }
}

final class ProductDetailTitleCellViewModel: ProductDetailCellViewable {
    
    let title: String
    
    init(productDetail: ProductDetail) {
        title = productDetail.title ?? ""
    }
}
