import Foundation


public struct Product {
    var name: String
    var unitPrice: Int
}


extension Product: Codable {}
extension Product: Hashable {}
