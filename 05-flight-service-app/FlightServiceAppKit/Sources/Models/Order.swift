import Foundation


public struct Order {
    public var seat: String
    public var lineItems: [LineItem]
    
    public let creationDate = Date()
}
extension Order: Codable {}


// MARK: - Order.LineItem
extension Order {
    
    public struct LineItem {
        public var product: Product
        public var count: Int
        
        public var price: Int { product.unitPrice * count }
    }
    
}
extension Order.LineItem: Codable {}



// MARK: - Initialization
extension Order {
    
    public init(seat: String, lineItemCounts: [Product: Int]) {
        self.seat = seat
        self.lineItems = lineItemCounts.compactMap({ (product, count) in
            count > 0 ? LineItem.init(product: product, count: count) : nil
        })
    }
}


// MARK: - Computeds
extension Order {
    
    public var totalPrice: Int {
        lineItems.reduce(0) { (accumulated, current) in
            accumulated + current.price
        }
    }
}

