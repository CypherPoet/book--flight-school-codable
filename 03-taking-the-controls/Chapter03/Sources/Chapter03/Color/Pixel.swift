import Foundation


enum ColorEncodingStrategy {
    case rgb
    case hexadecimal(includesHash: Bool)
}


extension CodingUserInfoKey {
    static let colorEncodingStrategy = CodingUserInfoKey(rawValue: "colorEncodingStrategy")!
}


struct Pixel {
    var red: UInt8
    var green: UInt8
    var blue: UInt8
}


extension Pixel: Encodable {
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        let colorEncodingStrategy = encoder.userInfo[.colorEncodingStrategy] as? ColorEncodingStrategy

        switch colorEncodingStrategy {
        case .hexadecimal(let includesHash):
            let hexString = "\(includesHash ? "#" : "")" +
                String(format: "%02X%02X%02X", red, green, blue)

            try container.encode(hexString)
            
        case .rgb, .none:
            try container.encode(String(format: "%d, %d, %d", red, green, blue))
        }
    }
}
