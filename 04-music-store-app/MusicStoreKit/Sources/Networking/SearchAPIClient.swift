import Foundation
import Combine
import NetStack



public final class SearchAPIClient: TransportRequestPublishing {
    public typealias Model = SearchResponse

    public let session: URLSession

    public init(session: URLSession = URLSession.shared) {
        self.session = session
    }
}
