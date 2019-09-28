//
//  File.swift
//  
//
//  Created by Brian Sipple on 9/27/19.
//

import Foundation

enum Fuel: String {
    case jetA = "Jet A"
    case jetB = "Jet B"
    case oneHundredLowLead = "100LL"
}

extension Fuel: Decodable {}

protocol FuelPrice {
    var fuelType: Fuel { get }
    var pricePerLiter: Decimal { get }
    var currencySymbol: String { get }
}

