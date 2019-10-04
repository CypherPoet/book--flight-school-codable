import Foundation


public struct EBook: MediaType {
    
    public enum Entity: String, SearchAPIQueryParam {
        public var queryParamName: String { "entity" }
        
        case ebook
    }

    
    // FIXME: Speculative
    public enum Attribute: String, SearchAPIQueryParam {
        public var queryParamName: String { "attribute" }
        
        case title = "titleTerm"
        case author = "authorTerm"
        case genre = "genreIndex"
        case rating = "ratingIndex"
    }
}
