import Foundation


struct TVShow: MediaType {
    
    enum Entity: String, SearchAPIQueryParam {
        public var queryParamName: String { "entity" }
        
        case episode = "tvEpisode"
        case season = "tvSeason"
    }
    
    
    enum Attribute: String, SearchAPIQueryParam {
        public var queryParamName: String { "attribute" }
        
        case genre = "genreIndex"
        case episode = "tvEpisodeTerm"
        case show = "showTerm"
        case season = "tvSeasonTerm"
        case rating = "ratingIndex"
        case description = "descriptionTerm"
    }
}
