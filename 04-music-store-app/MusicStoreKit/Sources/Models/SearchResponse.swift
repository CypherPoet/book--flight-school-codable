import Foundation


public struct SearchResponse {
    public let results: [SearchResult]
}
extension SearchResponse: Decodable {}


public extension SearchResponse {
    var nonExplicitTracks: [SearchResult] {
        results.filter { $0.trackExplicitness != .explicit }
    }
}
    
