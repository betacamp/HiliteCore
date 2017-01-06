import Foundation
import SwiftyJSON

public class PendingUploadJsonBackedPurchaser: Purchaser {
    let json:JSON?
    
    public init(purchaserJson: JSON?) {
        self.json = purchaserJson
    }
    
    public func displayName() -> String {
        return self.json?["purchaserDisplayName"].string ?? ""
    }
}
