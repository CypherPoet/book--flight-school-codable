import XCTest
@testable import Chapter03

final class FuelPriceTests: XCTestCase {
    
    enum FileURL {
        private static let testDataDirectory = URL(fileURLWithPath: #file)
            .deletingPathExtension()
            .deletingLastPathComponent()
            .appendingPathComponent("TestData", isDirectory: true)
        
        
        static let americanFuelPrices = Self.testDataDirectory
            .appendingPathComponent("american-fuel-prices", isDirectory: false)
            .appendingPathExtension("json")
        
        static let canadianFuelPrices = Self.testDataDirectory
            .appendingPathComponent("canadian-fuel-prices", isDirectory: false)
            .appendingPathExtension("json")
    }
    

    enum TestData {
        static let americanFuelPrices = try! Data(contentsOf: FileURL.americanFuelPrices)
        static let canadianFuelPrices = try! Data(contentsOf: FileURL.canadianFuelPrices)
    }
}

extension FuelPriceTests {
    
    func testDecodingAmericanFuelPrice() {
        let decoder = JSONDecoder()
        
        XCTAssertNoThrow({
            let fuelPrices = try decoder.decode([AmericanFuelPrice].self, from: TestData.americanFuelPrices)
            
            XCTAssertEqual(fuelPrices.count, 2)
            XCTAssertEqual(fuelPrices[0].fuelType, Fuel.oneHundredLowLead)
            XCTAssertEqual(fuelPrices[0].currencySymbol, "USD")
        })
    }
    
    
    func testDecodingCanadianFuelPrice() {
        let decoder = JSONDecoder()
        
        XCTAssertNoThrow({
            let fuelPrices = try decoder.decode([CanadianFuelPrice].self, from: TestData.canadianFuelPrices)
            
            XCTAssertEqual(fuelPrices.count, 3)
            XCTAssertEqual(fuelPrices[1].fuelType, Fuel.jetA)
            XCTAssertEqual(fuelPrices[0].currencySymbol, "CAD")
        })
    }
    

    static var allTests = [
        ("testDecodingAmericanFuelPrice", testDecodingAmericanFuelPrice),
        ("testDecodingCanadianFuelPrice", testDecodingCanadianFuelPrice),
    ]
}
