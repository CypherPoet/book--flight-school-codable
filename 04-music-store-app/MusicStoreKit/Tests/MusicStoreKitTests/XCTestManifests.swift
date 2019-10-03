#if !canImport(ObjectiveC)
import XCTest

extension SearchAPIClientTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__SearchAPIClientTests = [
        ("testPerformingRequest", testPerformingRequest),
    ]
}

extension SearchResultTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__SearchResultTests = [
        ("testArtworkURLForSize", testArtworkURLForSize),
        ("testDecodingFromData", testDecodingFromData),
    ]
}

public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SearchAPIClientTests.__allTests__SearchAPIClientTests),
        testCase(SearchResultTests.__allTests__SearchResultTests),
    ]
}
#endif
