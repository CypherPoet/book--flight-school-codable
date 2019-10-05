//
//  File.swift
//  
//
//  Created by Brian Sipple on 10/1/19.
//

import Foundation
import CypherPoetCore


extension Endpoint {
    
    public static func iTunesSearchAPI() -> Endpoint {
        Endpoint(host: "itunes.apple.com", path: "/search")
    }
    
    
    public static func iTunesSearchAPI(
        matching term: String,
        locale: Locale = Locale.current,
        entity: String? = nil,
        attribute: String? = nil,
        callback: String? = nil,
        limit: Int? = nil,
        version: SearchAPIVersion? = nil,
        explicit: Bool = true
    ) -> Endpoint {
        var endpoint = Endpoint.iTunesSearchAPI()
        
        endpoint.queryItems = [
            URLQueryItem(name: "\(QueryParam.term)", value: term),
            URLQueryItem(name: "\(QueryParam.limit)", value: "\(limit ?? .max)"),
            URLQueryItem(name: "\(QueryParam.version)", value: version?.urlValue ?? SearchAPIVersion.two.urlValue),
            URLQueryItem(name: "\(QueryParam.explicit)", value: explicit ? "YES" : "NO"),
        ]
        
        
        if let regionCode = locale.regionCode {
            endpoint.queryItems.append(.init(name: "\(QueryParam.country)", value: regionCode))
        }
        
        if let entity = entity {
            endpoint.queryItems.append(.init(name: "\(QueryParam.entity)", value: entity))
        }
        
        if let attribute = attribute {
            endpoint.queryItems.append(.init(name: "\(QueryParam.attribute)", value: attribute))
        }
        
        if let callback = callback {
            endpoint.queryItems.append(.init(name: "\(QueryParam.callback)", value: callback))
        }
        
        return endpoint
    }
}
