//
//  SearchInteractor.swift
//  FreeMarket
//
//  Created by Vinicius Campos Garcia on 07/04/19.
//  Copyright © 2019 MoviniSolutions. All rights reserved.
//

import Foundation

protocol SearchListener {
    func searchInteract(with event: SearchInteractor.Event)
}

final class SearchInteractor {
    
    enum Event {
        case search(_ query: String)
        case cancel
    }
    
    //---------------------------------------------
    // MARK: - Private properties
    //---------------------------------------------
    
    private let listener: SearchListener
    
    //---------------------------------------------
    // MARK: - Initialization
    //---------------------------------------------
    
    init(listener: SearchListener) {
        self.listener = listener
    }
}

//---------------------------------------------
// MARK: - SearchPresentableListener
//---------------------------------------------

extension SearchInteractor: SearchPresentableListener {
    
    func didTapSeeResultsButton(query: String) {
        listener.searchInteract(with: .search(query))
    }
    
    func didTapCancelButton() {
        listener.searchInteract(with: .cancel)
    }
}
