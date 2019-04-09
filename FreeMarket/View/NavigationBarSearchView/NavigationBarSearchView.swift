//
//  NavigationBarSearchView.swift
//  FreeMarketUI
//
//  Created by Vinicius Campos Garcia on 07/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation
import UIKit

public protocol NavigationBarSearchViewDelegate: class {
    func didTapCancelButton()
    func didTapSeeResults(query: String)
}

final class NavigationBarSearchView: XibView {
    
    //---------------------------------------------
    // MARK: - Outlets
    //---------------------------------------------
    
    @IBOutlet weak var queryTextField: UITextField! {
        didSet {
            queryTextField.enablesReturnKeyAutomatically = false
            queryTextField.delegate = self
            queryTextField.returnKeyType = .search
        }
    }
    
    //---------------------------------------------
    // MARK: - Public properties
    //---------------------------------------------
    
    weak var delegate: NavigationBarSearchViewDelegate?
    
    var isSearching: Bool {
        get {
            return queryTextField.isFirstResponder
        }
        set {
            if newValue {
                queryTextField.becomeFirstResponder()
            } else {
                queryTextField.resignFirstResponder()
            }
        }
    }
    
    override public var intrinsicContentSize: CGSize {
        return UIView.layoutFittingExpandedSize
    }
    
    //---------------------------------------------
    // MARK: - Initialization
    //---------------------------------------------
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //---------------------------------------------
    // MARK: - Actions
    //---------------------------------------------
    
    @IBAction private func cancelButtonTap() {
        isSearching = false
        delegate?.didTapCancelButton()
    }
}

extension NavigationBarSearchView: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let query = queryTextField.text, !query.isEmpty {
            isSearching = false
            delegate?.didTapSeeResults(query: query)
        }
        return true
    }
}
