//
//  ProductDetailCellViewable.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 10/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation
import UIKit

protocol ProductDetailCellViewable {
    var type: AnyClass { get }
    var reuseIdentifier: String { get }
    func configure(cell: UITableViewCell)
}
