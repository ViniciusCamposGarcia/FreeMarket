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
    
    func fadeIn() {
        
        self.alpha = 0
        
        UIView.animate(withDuration: 0.3) {
            self.alpha = 1
        }
    }
    
    func fadeOut() {
        
        self.alpha = 1
        
        UIView.animate(withDuration: 0.3) {
            self.alpha = 0
        }
    }
}
