//
//  ProductDetailTitleTableViewCell.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 11/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import UIKit

class ProductDetailTitleTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(viewModel: ProductDetailTitleCellViewModel) {
        titleLabel.text = viewModel.title
    }
}
