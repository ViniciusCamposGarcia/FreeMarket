//
//  ProductDetailImageTableViewCell.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 10/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import UIKit

class ProductDetailImageTableViewCell: UITableViewCell {

    //---------------------------------------------
    // MARK: - Outlets
    //---------------------------------------------
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productImageViewTopConstraint: NSLayoutConstraint!
    
    func configure(viewModel: ProductDetailImageTableViewModel) {
        
    }
}
