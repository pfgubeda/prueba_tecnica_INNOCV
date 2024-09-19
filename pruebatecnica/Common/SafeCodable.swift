
import Foundation

public struct Safe<Base: Decodable>: Decodable {
    
    public let value: Base?
    
    /**
     Decode a `Base` element into a optional way. If decode if not possible
     the wrapper store a nil value and print an advice
     */
    public init(from decoder: Decoder) throws {
        do {
            let container = try decoder.singleValueContainer()
            self.value = try container.decode(Base.self)
        } catch {
            print("[Codable] Safe alert -> value ignored \(error)")
            self.value = nil
        }
    }
}
