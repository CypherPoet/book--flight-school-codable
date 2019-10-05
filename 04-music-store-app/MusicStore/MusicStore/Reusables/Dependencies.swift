//
//  Dependencies.swift
//  MusicStore
//
//  Created by Brian Sipple on 10/4/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import Foundation
import MusicStoreKit


struct Dependencies {
    var searchAPIClient: SearchAPIClient
}



extension Dependencies {
    
    static func makeAppReducer() -> Reducer<AppState, AppMutation>  {
        return { state, mutation in
            switch mutation {
            case .searchResults(let results):
                state.searchResults = results
            }
        }
    }
}


let dependencies = Dependencies(searchAPIClient: SearchAPIClient())
