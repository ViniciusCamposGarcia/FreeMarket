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

final class HomeInteractor {
    
    enum Event {
        case openSearch
    }
    
    //-----------------------------------------------------------------------------
    // MARK: - Private properties
    //-----------------------------------------------------------------------------
    
    private let listener: HomeListener
    
    //-----------------------------------------------------------------------------
    // MARK: - Initialization
    //-----------------------------------------------------------------------------
    
    init(listener: HomeListener) {
        self.listener = listener
    }
}

//-----------------------------------------------------------------------------
// MARK: - HomePresentableListener
//-----------------------------------------------------------------------------

extension HomeInteractor: HomePresentableListener {
    
    func didTapSearchButton() {
        listener.homeInteract(with: .openSearch)
    }
}
