import Foundation
import SwiftyJSON

public class JSONBackedPlayerProfileSocialCard: PlayerProfileSocialCard {
    var json: JSON!
    
    public init(json: JSON!) {
        self.json = json
    }
    
    public func twitterUsername() -> String? {
        return json["twitter"]["handle"].string
    }
    public func updateTwitterUsername(_ newTwitterUsername: String?) {
        if let username = newTwitterUsername {
            var jsonCopy:JSON = self.json
            
            jsonCopy["twitter"] = JSON(["handle": username])
            
            self.json = jsonCopy
        }
    }
    public func facebookUsername() -> String? {
        return json["facebook"]["handle"].string
    }
    public func instagramUsername() -> String? {
        return json["instagram"]["handle"].string
    }
    
    public func toJSON() -> JSON! {
        return json
    }
}
