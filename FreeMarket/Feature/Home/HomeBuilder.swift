//
//  HomeBuilder.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 07/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation
import UIKit

final class HomeBuilder {
    
    func build(with listener: HomeListener) -> UIViewController {
      
        let homeInteractor = HomeInteractor(listener: listener)
        let homeViewController = HomeViewController(listener: homeInteractor)
        return homeViewController
    }
}
