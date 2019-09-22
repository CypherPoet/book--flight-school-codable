import Foundation

public enum Main {
    
    public static func run() {
        
        let plane = Plane(
            manufacturer: "Cessna",
            model: "172 Skyhawk",
            seats: 4
        )
        
        print(plane)
    }
}
