import Foundation


public struct Music: MediaType {
    
    public enum Entity: String, SearchAPIQueryParam {
        public var queryParamName: String { "entity" }
        
        case artist = "musicArtist"
        case track = "musicTrack"
        case album
        case musicVideo
        case mix
        case song
    }
    
    public enum Attribute: String, SearchAPIQueryParam {
        public var queryParamName: String { "attribute" }
        
        case mix = "mixTerm"
        case genre = "genreIndex"
        case artist = "artistTerm"
        case composer = "composerTerm"
        case album = "albumTerm"
        case rating = "ratingIndex"
        case song = "songTerm"
    }
}
