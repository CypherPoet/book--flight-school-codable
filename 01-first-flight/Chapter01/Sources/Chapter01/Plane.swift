import Foundation

public struct Plane {
    public var manufacturer: String
    public var model: String
    public var seats: Int
    
//
//    private enum CodingKeys: String, CodingKey {
//        case manufacturer
//        case model
//        case seats
//    }
}


// MARK: - Decodable
extension Plane: Decodable {
    
//    public init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        self.manufacturer = try container.decode(String.self, forKey: .manufacturer)
//        self.model = try container.decode(String.self, forKey: .model)
//        self.seats = try container.decode(Int.self, forKey: .seats)
//    }
}


// MARK: - Encodable
extension Plane: Encodable {
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//
//        try container.encode(manufacturer, forKey: .manufacturer)
//        try container.encode(model, forKey: .model)
//        try container.encode(seats, forKey: .seats)
//    }
}


// 🔑 The code that's commented out is a demonstration of how
// Swift automatically synthesizes conformance for `Decodable` and
// `Encodable` -- as long as each of its properties has a type that conforms.
