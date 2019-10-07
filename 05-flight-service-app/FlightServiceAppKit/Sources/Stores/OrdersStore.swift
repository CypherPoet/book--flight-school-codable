import Foundation
import Combine
import CypherPoetCore


public final class OrdersStore: ObservableObject {
    
    @UserDefault("orderData")
    private var orderData: Data
    
    
    @Published public var orders: [Order] {
        get {
            return decodeOrderData()
        }
        set {
            encodeOrderData(using: newValue)
        }
    }
}


extension OrdersStore {
    
    private func decodeOrderData() -> [Order] {
        let decoder = PropertyListDecoder()
        
        do {
            return try decoder.decode([Order].self, from: orderData)
        } catch {
            print("Error decoding order data: \(error.localizedDescription)")
            return []
        }
    }
    
    
    private func encodeOrderData(using orders: [Order]) {
        let encoder = PropertyListEncoder()
        
        do {
            orderData = try encoder.encode(orders)
        } catch {
            print("Error encoding order data: \(error.localizedDescription)")
        }
    }
}
