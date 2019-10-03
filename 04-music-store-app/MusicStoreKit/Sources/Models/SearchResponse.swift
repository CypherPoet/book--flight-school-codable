import Foundation


public struct SearchResponse {
    let results: [SearchResult]
}
extension SearchResponse: Decodable {}


public extension SearchResponse {
    var nonExplicitTracks: [SearchResult] {
        results.filter { $0.trackExplicitness != .explicit }
    }
}
    
