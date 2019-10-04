import Foundation


public struct Movie: MediaType {
    
    public enum Entity: String, SearchAPIQueryParam {
        public var queryParamName: String { "entity" }
        
        case movie
        case artist = "movieArtist"
    }
    
    
    public enum Attribute: String, SearchAPIQueryParam {
        public var queryParamName: String { "attribute" }
        
        case actor = "actorTerm"
        case genre = "genreIndex"
        case artist = "artistTerm"
        case shortFilm = "shortFilmTerm"
        case producer = "producerTerm"
        case ratingTerm = "ratingTerm"
        case director = "directorTerm"
        case releaseYear = "releaseYearTerm"
        case featureFilm = "featureFilmTerm"
        case movieArtist = "movieArtistTerm"
        case movie = "movieTerm"
        case ratingIndex = "ratingIndex"
        case description = "descriptionTerm"
    }
}
