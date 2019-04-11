//
//  ProductDetailImageTableViewModel.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 10/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

extension ProductDetailCellViewable where Self: ProductDetailImageCellViewModel {
    
    func configured(cell: UITableViewCell,
                    offsetControlProperty: ControlProperty<CGPoint>) -> UITableViewCell {
        
        (cell as? ProductDetailImageTableViewCell)?.configure(viewModel: self,
                                                              offsetControlProperty: offsetControlProperty)
        return cell
    }
    
    var type: AnyClass {
        return ProductDetailImageTableViewCell.self
    }
}

final class ProductDetailImageCellViewModel: ProductDetailCellViewable {
    
    let imageURLString: String?
    
    init(productDetail: ProductDetail) {
        self.imageURLString = productDetail.thumbnail
    }
}
