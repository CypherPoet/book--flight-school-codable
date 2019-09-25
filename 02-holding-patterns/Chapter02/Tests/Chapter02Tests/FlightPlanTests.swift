import XCTest
@testable import Chapter02

final class FlightPlanTests: XCTestCase {
    
    enum TestValues {
        static let aircraft = Aircraft(identification: "NA12345", color: "Blue/White")
        static let route = ["KTTD", "KHIO"]
        static let proposedDepartureDateString = "2018-04-20T14:15:00-07:00"
    }
    
    
    enum TestData {
        
        static let flatPayload = """
        {
            "aircraft": {
            "identification": "\(TestValues.aircraft.identification)",
                "color": "Blue/White"
            },
            "route": ["KTTD", "KHIO"],
            "departure_time": {
            "proposed": "\(TestValues.proposedDepartureDateString)",
                "actual": "2018-04-20T14:20:00-07:00"
            },
            "flight_rules": "IFR",
            "remarks": null
        }
        """.data(using: .utf8)!
    }
}


extension FlightPlanTests {
    
    func testInitFromData() {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        XCTAssertNoThrow({
            let flightPlan = try decoder.decode(FlightPlan.self, from: TestData.flatPayload)
            
            XCTAssertEqual(flightPlan.aircraft.identification, TestValues.aircraft.identification)
            XCTAssertEqual(flightPlan.aircraft.color, TestValues.aircraft.color)
            
            let proposedDepartureDate = try XCTUnwrap(flightPlan.proposedDepartureDate)
            let proposedDepartureDateString = DateFormatter().string(from: proposedDepartureDate)
            
            XCTAssertEqual(proposedDepartureDateString, TestValues.proposedDepartureDateString)
        })
    }
    
}


// MARK: - Test Manifests
extension FlightPlanTests {
    static var allTests = [
        ("testInitFromData", testInitFromData),
    ]
}
