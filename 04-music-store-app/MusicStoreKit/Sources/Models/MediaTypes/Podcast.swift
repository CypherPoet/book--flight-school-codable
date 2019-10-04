import Foundation


public struct Podcast: MediaType {

    public enum Entity: String, SearchAPIQueryParam {
        public var queryParamName: String { "entity" }

        case podcast
        case author = "podcastAuthor"
    }
    

    public enum Attribute: String, SearchAPIQueryParam {
        public var queryParamName: String { "attribute" }

        case title = "titleTerm"
        case language = "languageTerm"
        case author = "authorTerm"
        case genre = "genreIndex"
        case artist = "artistTerm"
        case rating = "ratingIndex"
        case keywords = "keywordsTerm"
        case description = "descriptionTerm"
    }
}
