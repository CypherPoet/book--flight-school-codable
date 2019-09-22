import XCTest
@testable import Chapter01


final class Chapter01Tests: XCTestCase {
    
    enum TestPlane {
        static let plane1 = Plane(
            manufacturer: "Cessna",
            model: "172 Skyhawk",
            seats: 4
        )
        static let plane2 = Plane(
            manufacturer: "Piper",
            model: "PA-28 Cherokee",
            seats: 4
        )
    }
    
    
    enum TestData {
        
        static let flatPayload = """
        {
            "manufacturer": "\(TestPlane.plane1.manufacturer)",
            "model": "\(TestPlane.plane1.model)",
            "seats": \(TestPlane.plane1.seats),
        }
        """.data(using: .utf8)!
        
        
        static let keyedArrayPayload = """
        "planes": [
            {
                "manufacturer": "\(TestPlane.plane1.manufacturer)",
                "model": "\(TestPlane.plane1.model)",
                "seats": \(TestPlane.plane1.seats),
            },
            {
                "manufacturer": "\(TestPlane.plane2.manufacturer)",
                "model": "\(TestPlane.plane2.model)",
                "seats": \(TestPlane.plane2.seats),
            },
        ]
        """.data(using: .utf8)!
    }
}


// MARK: - Flat Payload
extension Chapter01Tests {
    
    func testDecodingFromFlatJSON() {
        let decoder = JSONDecoder()
        
        XCTAssertNoThrow({
            let plane = try decoder.decode(Plane.self, from: TestData.flatPayload)
            
            XCTAssertEqual(plane.manufacturer, "Cessna")
        })
    }
    
    
    func testEncodingToFlatJSON() {
        let encoder = JSONEncoder()
        
        XCTAssertNoThrow({
            let data = try encoder.encode(TestPlane.plane1)
            
            let encodedDataString = String(data: data, encoding: .utf8)!
            let expectedDataString = String(data: TestData.flatPayload, encoding: .utf8)!
            
            XCTAssertEqual(encodedDataString, expectedDataString)
        })
    }
}


// MARK: - Keyed Dictionary Array Payload
extension Chapter01Tests {

    func testDecodingFromKeyedJSON() {
        let decoder = JSONDecoder()

        XCTAssertNoThrow({
            let keyedPlanes = try decoder.decode(
                [String: [Plane]].self,
                from: TestData.keyedArrayPayload
            )
            
            let planes = try XCTUnwrap(keyedPlanes["planes"])
            
            XCTAssertEqual(planes.count, 2)
            XCTAssertEqual(planes[0].manufacturer, TestPlane.plane1.manufacturer)
            XCTAssertEqual(planes[1].manufacturer, TestPlane.plane2.manufacturer)
        })
    }


    func testEncodingToKeyedJSON() {
        let encoder = JSONEncoder()

        XCTAssertNoThrow({
            let data = try encoder.encode([TestPlane.plane1, TestPlane.plane2])

            let encodedDataString = String(data: data, encoding: .utf8)!
            let expectedDataString = String(data: TestData.keyedArrayPayload, encoding: .utf8)!

            XCTAssertEqual(encodedDataString, expectedDataString)
        })
    }
}



// MARK: - Test Manifests
extension Chapter01Tests {
    static var allTests = [
        ("testDecodingFromFlatJSON", testDecodingFromFlatJSON),
        ("testEncodingToFlatJSON", testEncodingToFlatJSON),
        ("testDecodingFromKeyedJSON", testDecodingFromKeyedJSON),
        ("testEncodingToKeyedJSON", testEncodingToKeyedJSON),
    ]
}
