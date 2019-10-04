import Foundation
import CypherPoetCore

/// A protocol describing search API "Media Types" and their corresponding,
/// media-type-based query-parameter properties.
public protocol MediaType {

    /// This should be an enum type that stores cases of the "entity" query parameter
    associatedtype Entity: SearchAPIQueryParam

    /// This should be an enum type that stores cases of the "attribute" query parameter
    associatedtype Attribute: SearchAPIQueryParam
}


/// This should be an enum type that stores cases of a specific query parameter
/// TODO: This might not be necessary
public protocol SearchAPIQueryParam: RawRepresentable where RawValue == String {
    var queryParamName: String { get }
}



extension MediaType {
    
    private func encode(_ value: Locale?) -> (country: String, language: String?)? {
        guard let locale = value, let country = locale.regionCode else {
            return nil
        }
        
        if let language = locale.languageCode {
            return (country, "\(language)_\(country)".lowercased())
        } else {
            return (country, nil)
        }
    }
}
