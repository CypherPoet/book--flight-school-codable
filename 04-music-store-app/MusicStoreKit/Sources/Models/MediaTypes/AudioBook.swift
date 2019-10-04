import Foundation


public struct AudioBook: MediaType {
    
    public enum Entity: String, SearchAPIQueryParam {
        public var queryParamName: String { "entity" }
        
        case audiobook
        case author = "audiobookAuthor"
    }
    
    
    public enum Attribute: String, SearchAPIQueryParam {
        public var queryParamName: String { "attribute" }
        
        case title = "titleTerm"
        case author = "authorTerm"
        case genre = "genreIndex"
        case rating = "ratingIndex"
    }
}

