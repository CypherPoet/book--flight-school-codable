import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(FuelPriceTests.allTests),
        testCase(FlightRouteTests.allTests),
    ]
}
#endif
