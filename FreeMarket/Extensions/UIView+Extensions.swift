//
//  UIView+Extensions.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 09/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func fadeIn(completion: (() -> Void)?) {
        
        UIView.animate(withDuration: 0.3, animations: {
            
            self.alpha = 1
            
        }, completion: { _ in
            
            completion?()
        })
    }
    
    func fadeOut(completion: (() -> Void)?) {
        
        UIView.animate(withDuration: 0.3, animations: {
            
            self.alpha = 0
            
        }, completion: { _ in
            
            completion?()
        })
    }
}
