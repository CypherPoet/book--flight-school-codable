import Foundation

/// A result returned from the iTunes Search API.
public struct SearchResult {
    /// The name of the track, song, video, TV episode, and so on.
    let trackName: String?

    /// The explicitness of the track.
    let trackExplicitness: Explicitness?

    /// An iTunes Store URL for the content.
    let trackViewURL: URL?

    /// A URL referencing the 30-second preview file
    /// for the content associated with the returned media type.
    /// - Note: This is available when media type is track.
    let previewURL: URL?

    /// The name of the artist, and so on.
    let artistName: String?

    /// The name of the album, TV season, audiobook, and so on.
    let collectionName: String?

    /// A URL for the artwork associated with the returned media type.
    private let artworkURL100: URL?
}
extension SearchResult: Decodable {}


extension SearchResult {
    
    public func artworkURL(forSize dimension: Int = 100) -> URL? {
        guard
            let originalURL = artworkURL100,
            dimension != 100,
            dimension > 0,
            dimension < 1000
        else { return artworkURL100 }

        return originalURL
            .deletingPathExtension()
            .deletingLastPathComponent()
            .appendingPathComponent("\(dimension)x\(dimension)bb")
            .appendingPathExtension("jpg")
    }
        
}


extension SearchResult {
    private enum CodingKeys: String, CodingKey {
        case trackName
        case trackExplicitness
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artistName
        case collectionName
        case artworkURL100 = "artworkUrl100"
    }
}


                       
