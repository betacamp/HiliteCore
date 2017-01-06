import Foundation
import SwiftyJSON

public class OrderJSONBackedRecipient: Recipient {
    let json: JSON!
    
    public init(orderJson: JSON!) {
        self.json = orderJson
    }
    
    public func displayName() -> String {
        return json["recipientName"].stringValue
    }
}
