import Foundation

struct AmericanFuelPrice {
    private var fuel: Fuel
    
    /// USD/gallon
    var price: Decimal
}

extension AmericanFuelPrice: FuelPrice {
    var fuelType: Fuel { self.fuel }
    var pricePerLiter: Decimal { price / 3.78541 }
    var currencySymbol: String { "USD" }
}

extension AmericanFuelPrice: Decodable {}
