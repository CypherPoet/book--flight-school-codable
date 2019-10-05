//
//  AppStateAction.swift
//  MusicStore
//
//  Created by Brian Sipple on 10/5/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import Foundation
import Combine


enum AppStateAction: StateMutatingAction {
    case search(term: String)

    func mapToMutation() -> AnyPublisher<AppMutation, Never> {
        switch self {
        case .search(let term):
            return dependencies.searchAPIClient
                .searchPublisher(matching: term)
                .replaceError(with: [])
                .map { AppMutation.searchResults(results: $0) }
                .eraseToAnyPublisher()
        }
    }
}
