import Foundation


public enum SearchAPIVersion: Int {
    case one
    case two
}


extension SearchAPIVersion {
    public var urlValue: String {
        switch self {
        case .one:
            return "1"
        case .two:
            return "2"
        }
    }
}
