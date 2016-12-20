import Foundation
import SwiftyJSON

public protocol PlayerProfileSocialCard {
    func twitterUsername() -> String?
    func updateTwitterUsername(_ newTwitterUsername: String?)
    func instagramUsername() -> String?
    func facebookUsername() -> String?
    
    func toJSON() -> JSON!
}
