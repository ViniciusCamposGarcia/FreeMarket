//
//  UIViewController+Extensions.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 11/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func presentAlert(with viewError: ViewError, retryHandler: (() -> Void)?) {
        
        let alert = UIAlertController(title: viewError.errorTitle, message: viewError.errorMessage, preferredStyle: .alert)
        
        if let retryHandler = retryHandler, viewError.canRetry {
            alert.addAction(UIAlertAction(title: "Tentar novamente", style: .default) { _ in
                retryHandler()
            })
        }
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
