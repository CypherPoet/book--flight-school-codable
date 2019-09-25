import Foundation


enum FlightRules: String {
    case visual = "VFR"
    case instrumentation = "IFR"
}

extension FlightRules: Codable {}

