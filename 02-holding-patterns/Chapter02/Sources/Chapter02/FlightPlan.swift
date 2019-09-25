//
//  File.swift
//  
//
//  Created by Brian Sipple on 9/23/19.
//

import Foundation


struct FlightPlan {
    var aircraft: Aircraft
    var route: [String]
    var flightRules: FlightRules
    var remarks: String?
    
    private var departureDates: [String: Date]
    
    private enum CodingKeys: String, CodingKey {
        case aircraft
        case route
        case flightRules = "flight_rules"
        case departureDates = "departure_time"
        case remarks
    }
}


extension FlightPlan {
    var proposedDepartureDate: Date? { departureDates["proposed"] }
    var actualDepartureDate: Date? { departureDates["actual"] }
}


extension FlightPlan: Decodable {}


