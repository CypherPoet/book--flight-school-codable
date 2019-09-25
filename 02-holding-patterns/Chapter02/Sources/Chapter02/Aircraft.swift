import Foundation


struct Aircraft {
    var identification: String
    var color: String
}

extension Aircraft: Codable {}
