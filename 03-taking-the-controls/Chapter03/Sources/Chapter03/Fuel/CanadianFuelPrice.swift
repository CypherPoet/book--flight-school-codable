import Foundation


struct CanadianFuelPrice {
    private var type: Fuel

    /// CAD/liter
    var price: Decimal
}


extension CanadianFuelPrice: FuelPrice {
    var fuelType: Fuel { self.type }
    var pricePerLiter: Decimal { self.price }
    var currencySymbol: String { "CAD" }
}

extension CanadianFuelPrice: Decodable {}
