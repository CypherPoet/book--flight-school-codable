import XCTest
@testable import Chapter03

final class PixelTests: XCTestCase {
    
    enum FileURL {
        private static let testDataDirectory = URL(fileURLWithPath: #file)
            .deletingPathExtension()
            .deletingLastPathComponent()
            .appendingPathComponent("TestData", isDirectory: true)
        
        static let colors = Self.testDataDirectory
            .appendingPathComponent("colors", isDirectory: false)
            .appendingPathExtension("json")
    }

    
    enum TestData {
        static let colors = try! Data(contentsOf: FileURL.colors)
    }
}


extension PixelTests {
    
    func testEncodingPixels() {
        let pixels = [
            Pixel(red: 0, green: 0, blue: 255),
            Pixel(red: 1, green: 45, blue: 0),
        ]

        let encoder = JSONEncoder()

        XCTAssertNoThrow({
            let colorData = try encoder.encode(pixels)

            let encodedColorDataString = String(data: colorData, encoding: .utf8)!
            let baseColorDataString = String(data: TestData.colors, encoding: .utf8)!
            
            XCTAssertEqual(encodedColorDataString, baseColorDataString)
        })
    }
    

    static var allTests = [
        ("testEncodingPixels", testEncodingPixels),
    ]
}
