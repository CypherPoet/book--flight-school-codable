import Foundation


public struct Software: MediaType {
    
    public enum Entity: String, SearchAPIQueryParam {
        public var queryParamName: String { "entity" }
        
        case software
        case iPadSoftware
        case macSoftware
    }
    
    
    public enum Attribute: String, SearchAPIQueryParam {
        public var queryParamName: String { "attribute" }
        
        case softwareDeveloper
    }
}
