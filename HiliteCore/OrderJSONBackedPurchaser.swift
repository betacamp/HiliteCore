import Foundation
import SwiftyJSON

public class OrderJSONBackedPurchaser: Purchaser {
    let json: JSON!
    
    public init(orderJson: JSON!) {
        self.json = orderJson
    }
    
    public func displayName() -> String {
        return json["senderName"].stringValue
    }
}
