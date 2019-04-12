//
//  SearchCartView.swift
//  FreeMarketUI
//
//  Created by Vinicius Campos Garcia on 07/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation
import UIKit

public protocol NavigationBarDummyViewDelegate: class {
    func navigationBarDummyViewSearchTap()
}

final class NavigationBarDummyView: XibView {
    
    //---------------------------------------------
    // MARK: - Outlets
    //---------------------------------------------
    
    @IBOutlet weak var searchView: UIView!
    
    //---------------------------------------------
    // MARK: - Public properties
    //---------------------------------------------
    
    weak var delegate: NavigationBarDummyViewDelegate?
    
    //---------------------------------------------
    // MARK: - Initialization
    //---------------------------------------------
    
    override public var intrinsicContentSize: CGSize {
        return UIView.layoutFittingExpandedSize
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //---------------------------------------------
    // MARK: - Private methods
    //---------------------------------------------
    
    @IBAction private func searchViewTap() {
        delegate?.navigationBarDummyViewSearchTap()
    }
}
