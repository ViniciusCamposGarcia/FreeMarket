//
//  ProductDetailImageTableViewCell.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 10/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import UIKit
import Kingfisher

class ProductDetailImageTableViewCell: UITableViewCell {

    //---------------------------------------------
    // MARK: - Outlets
    //---------------------------------------------
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productImageViewTopConstraint: NSLayoutConstraint!
    
    func configure(viewModel: ProductDetailImageTableViewModel) {
        
        let url = URL(string: viewModel.imageURLString)
        productImageView.kf.setImage(with: url,
                                     placeholder: UIImage(named: "loading"),
                                     options: [KingfisherOptionsInfoItem.memoryCacheExpiration(.seconds(60 * 10))])
    }
    
    func paralaxEffect(withOffset: CGFloat) {
        let distanceFromTop = min(withOffset * 0.3, productImageView.frame.height)
        UIView.animate(withDuration: 0.0) {
            self.productImageViewTopConstraint.constant = distanceFromTop
            self.layoutIfNeeded()
        }
    }
}
