import Foundation
import SwiftyJSON

public class JSONBackedCharityIdentityCard: CharityIdentityCard {
    let json: JSON!
    
    public init(json: JSON) {
        self.json = json
    }
    
    public func name() -> String? {
        return self.json["name"].string
    }
    
    public func displayName() -> String? {
        return json["displayName"].string
    }

    
    public func id() -> CharityId? {
        return self.json["id"].string
    }
}
