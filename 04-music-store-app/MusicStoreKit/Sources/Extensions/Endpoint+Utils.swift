//
//  File.swift
//  
//
//  Created by Brian Sipple on 10/1/19.
//

import Foundation
import CypherPoetCore


extension Endpoint {
    
    static func iTunesSearchAPI() -> Endpoint {
        Endpoint(host: "itunes.apple.com", path: "search")
    }
}
