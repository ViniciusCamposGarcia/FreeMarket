//
//  HomeInteractor.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 06/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation

protocol HomeListener {
    func homeInteract(with event: HomeInteractor.Event)
}

final class HomeInteractor: HomePresentableListener {
    
    enum Event {
        case openSearch
    }
    
    let listener: HomeListener
    
    init(listener: HomeListener) {
        self.listener = listener
    }
    
    func didTapSearchButton() {
        listener.homeInteract(with: .openSearch)
    }
}
