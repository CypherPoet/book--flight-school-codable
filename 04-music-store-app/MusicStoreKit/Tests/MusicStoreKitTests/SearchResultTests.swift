import XCTest
@testable import MusicStoreKit

final class SearchResultTests: XCTestCase {

    enum FileURL {
        static let testDataDirectory = URL(fileURLWithPath: #file)
            .deletingPathExtension()
            .deletingLastPathComponent()
            .appendingPathComponent("TestData", isDirectory: true)
     
        static let massEffectSearchResults = Self
            .testDataDirectory
            .appendingPathComponent("APIResponses", isDirectory: true)
            .appendingPathComponent("media-software-term-mass-effect", isDirectory: false)
            .appendingPathExtension("json")
    }
    
    enum TestData {
        static let massEffectResponse = try! Data(contentsOf: FileURL.massEffectSearchResults)
    }
}


extension SearchResultTests {
    
    func testDecodingFromData() {
        
    }
    
    func testArtworkURLForSize() {

    }

    static var allTests = [
        ("testArtworkURLForSize", testArtworkURLForSize),
    ]
}
