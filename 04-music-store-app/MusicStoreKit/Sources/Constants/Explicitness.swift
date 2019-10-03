import Foundation


enum Explicitness: String {
    
    /// Explicit lyrics, possibly explicit album cover
    case explicit
    
    /// Explicit lyrics “bleeped out”
    case clean
    
    /// No explicit lyrics
    case notExplicit
}
extension Explicitness: Decodable {}
