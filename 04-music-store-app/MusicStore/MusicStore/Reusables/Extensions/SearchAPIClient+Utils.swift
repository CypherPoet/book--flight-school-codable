//
//  SearchAPIClient+Utils.swift
//  MusicStore
//
//  Created by Brian Sipple on 10/4/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import Foundation
import Combine
import MusicStoreKit
import CypherPoetCore


extension SearchAPIClient {
    
    func searchPublisher(matching term: String) -> AnyPublisher<[SearchResult], Error> {
        let endpoint = Endpoint.iTunesSearchAPI(matching: term)
       
        guard let url = endpoint.url else {
            preconditionFailure("Can't create url for endpoint")
        }
        
        return perform(URLRequest(url: url))
            .map( { $0.results })
            .print()
            .eraseToAnyPublisher()
    }
}

