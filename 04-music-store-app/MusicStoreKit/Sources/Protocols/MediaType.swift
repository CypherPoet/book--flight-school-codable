//
//  File.swift
//  
//
//  Created by Brian Sipple on 10/1/19.
//

import Foundation

public protocol MediaType {
    associatedtype Entity: RawRepresentable where Entity.RawValue == String
    associatedtype Attribute: RawRepresentable where Entity.RawValue == String
}
