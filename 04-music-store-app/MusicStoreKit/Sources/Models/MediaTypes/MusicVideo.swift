import Foundation


public struct MusicVideo: MediaType {
    
    public enum Entity: String, SearchAPIQueryParam {
        public var queryParamName: String { "entity" }
        
        case musicVideo
        case artist = "musicArtist"
    }
    
    public enum Attribute: String, SearchAPIQueryParam {
        public var queryParamName: String { "attribute" }
        
        case genre = "genreIndex"
        case artist = "artistTerm"
        case album = "albumTerm"
        case rating = "ratingIndex"
        case song = "songTerm"
    }
}
