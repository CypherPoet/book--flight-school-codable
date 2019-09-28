import Foundation

struct Route {
    var points: [Airport]
    
    struct Airport: Decodable {
        var code: String
        var name: String
    }
}


extension Route {

    // The `Coding​Keys` requirement can also be satisfied by a
    // structure, and that structure can be conditionally initialized
    // with arbitrary `Int` or `String` values.
    private struct CodingKeys: CodingKey {
        static let points = CodingKeys(stringValue: "points")!
        
        var stringValue: String

        /// Opt out of using Integer-based keys
        var intValue: Int? { nil }
        
        /// Opt out of using Integer-based keys
        init?(intValue: Int) { nil }

        init?(stringValue: String) {
            self.stringValue = stringValue
        }
    }
}


extension Route: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let airportCodes = try container.decode([String].self, forKey: .points)
        
        self.points = try airportCodes.map { code in
            let airportKey = CodingKeys(stringValue: code)!
            
            return try container.decode(Airport.self, forKey: airportKey)
        }
    }
    
}
