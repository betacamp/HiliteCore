import Foundation
import SwiftyJSON

public class JSONBackedTask: Task {
    let taskJSON: JSON!
    
    public init(json: JSON!) {
        taskJSON = json
    }

    public func id() -> String? {
        return taskJSON["id"].stringValue
    }
    
    public func teleprompterText() -> String? {
        return taskJSON["teleprompter"].stringValue
    }
    
    public func purchaser() -> Purchaser? {
        return OrderJSONBackedPurchaser(orderJson: taskJSON["order"])
    }
    
    public func recipient() -> Recipient? {
        return OrderJSONBackedRecipient(orderJson: taskJSON["order"])
    }
    
    public func profileImageUrl() -> URL? {
        if let profileImageUrlString = taskJSON["profileImageUrl"].string {
            return URL(string: profileImageUrlString)
        }
        return nil
    }

    public func organization() -> Organization? {
        
        let organizationJson = taskJSON["organization"]
        let organization = JsonBackedOrganization(json: organizationJson)
        
        return organization
    }
    
    public func organizationName() -> String? {
        
        return organization()?.name()
    }
}
