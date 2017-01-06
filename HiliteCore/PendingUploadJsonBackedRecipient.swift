import Foundation
import SwiftyJSON

public class PendingUploadJsonBackedRecipient: Recipient {
    let json: JSON?
    
    public init(pendingUploadJson: JSON?) {
        self.json = pendingUploadJson
    }
    
    public func displayName() -> String {
        return self.json?["recipientDisplayName"].string ?? ""
    }
}
