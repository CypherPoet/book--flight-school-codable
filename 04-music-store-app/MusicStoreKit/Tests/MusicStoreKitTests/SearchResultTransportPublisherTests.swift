import XCTest
import Combine
import CypherPoetCore

@testable import MusicStoreKit

final class SearchResultTransportPublisherTests: XCTestCase {

    enum APIURL {
        static let mediaSoftwareTermMassEffect = URL(string: "https://itunes.apple.com/search?term=MassEffect&media=software&limit=5")!
    }
}


extension SearchResultTransportPublisherTests {
    
    func testPerformingRequest() {
        let expectation = XCTestExpectation(description: "Publisher should complete")
        let apiClient = SearchAPIClient()
        let request = URLRequest(url: APIURL.mediaSoftwareTermMassEffect)

        let publisher = apiClient.perform(request)
        
        var cancellables = Set<AnyCancellable>()
        
        publisher
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .failure:
                        print("Request failed")
                    case .finished:
                        expectation.fulfill()
                    }
                },
                receiveValue: { searchResponse in
                    print("Search response received")
                    XCTAssertEqual(searchResponse.results.count, 5)
                }
            )
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 5)
    }
}
