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


final class SearchInteractor: SearchPresentableListener{
    
    enum Event {
        case search(_ query: String)
    }
    
    let listener: SearchListener
    
    init(listener: SearchListener) {
        self.listener = listener
    }
    
    func didTapSeeResultsButton(query: String) {
        listener.searchInteract(with: .search(query))
    }
}
