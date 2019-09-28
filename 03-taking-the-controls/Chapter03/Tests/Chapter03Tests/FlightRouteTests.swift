import XCTest
@testable import Chapter03

final class FlightRouteTests: XCTestCase {
    
    enum FileURL {
        static let flightRoutes = URL(fileURLWithPath: #file)
            .deletingPathExtension()
            .deletingLastPathComponent()
            .appendingPathComponent("TestData", isDirectory: true)
            .appendingPathComponent("flight-routes", isDirectory: false)
            .appendingPathExtension("json")
    }
    

    enum TestData {
        static let flightRoutes = try! Data(contentsOf: FileURL.flightRoutes)
    }
    
    
    func testRouteDecoding() {
        let decoder = JSONDecoder()
        
        XCTAssertNoThrow({
            let route = try decoder.decode(Route.self, from: TestData.flightRoutes)
            
            XCTAssertEqual(route.points.count, 2)
        })
    }

    static var allTests = [
        ("testRouteDecoding", testRouteDecoding),
    ]
}
