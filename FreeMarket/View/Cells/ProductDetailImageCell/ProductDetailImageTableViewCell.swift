//
//  ProductDetailImageTableViewCell.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 10/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import UIKit
import Kingfisher
import RxSwift
import RxCocoa

class ProductDetailImageTableViewCell: UITableViewCell {

    //---------------------------------------------
    // MARK: - Outlets
    //---------------------------------------------
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productImageViewTopConstraint: NSLayoutConstraint!
    let disposeBag = DisposeBag()
    
    func configure(viewModel: ProductDetailImageCellViewModel, offsetControlProperty: ControlProperty<CGPoint>) {
        
        guard let imageURLString = viewModel.imageURLString else {
            return
        }
        
        let url = URL(string: imageURLString)
        productImageView.kf.setImage(with: url,
                                     placeholder: UIImage(named: "loading"),
                                     options: [KingfisherOptionsInfoItem.memoryCacheExpiration(.seconds(60 * 10))])
        
        offsetControlProperty.subscribe { event in
            if let offset = event.element {
                self.paralaxEffect(withOffset: offset.y)
            }
        }.disposed(by: disposeBag)
    }
    
    func paralaxEffect(withOffset: CGFloat) {
        let distanceFromTop = min(withOffset * 0.5, productImageView.frame.height)
        UIView.animate(withDuration: 0.0) {
            self.productImageViewTopConstraint.constant = distanceFromTop
            self.layoutIfNeeded()
        }
    }
}
