//
//  ProductTableViewCell.swift
//  FreeMarketUI
//
//  Created by Vinicius Campos Garcia on 07/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import UIKit
import Kingfisher

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var installmentsLabel: UILabel!
    @IBOutlet weak var shippingRuleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with viewModel: ProductCellViewModel) {
        let url = URL(string: viewModel.imageURLString)
        productImageView.kf.setImage(with: url,
                                     placeholder: UIImage(named: "loading"),
                                     options: [KingfisherOptionsInfoItem.memoryCacheExpiration(.seconds(60 * 10))])
        titleLabel.text = viewModel.title
        priceLabel.text = viewModel.priceString
        installmentsLabel.text = viewModel.installmentsDescription
        shippingRuleLabel.text = viewModel.freeShippingString
        installmentsLabel.textColor = viewModel.isZeroRate ? .zeroRateGreen : .black
    }
}
