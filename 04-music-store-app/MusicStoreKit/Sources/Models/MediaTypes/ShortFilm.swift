import Foundation


public struct ShortFilm: MediaType {
    
    public enum Entity: String, SearchAPIQueryParam {
        public var queryParamName: String { "entity" }
        
        case shortFilm
        case artist = "shortFilmArtist"
    }
    
    
    public enum Attribute: String, SearchAPIQueryParam {
        public var queryParamName: String { "attribute" }
        
        case genre = "genreIndex"
        case artist = "artistTerm"
        case shortFilm = "shortFilmTerm"
        case rating = "ratingIndex"
        case description = "descriptionTerm"
    }
}
