import Foundation
import SwiftyJSON

public class JSONBackedUserIdentityCard: UserIdentityCard {
    var jsonUser: JSON!
    var profiles: Dictionary<String, ProducerProfile>?
    
    public init(json:JSON!) {
        jsonUser = json

        var profilesDict = Dictionary<String, ProducerProfile>()
        for (verticalHandle, subJson):(String, JSON) in jsonUser["producerProfile"] {
            profilesDict[verticalHandle] = JSONBackedProducerProfile(json: subJson)
        }
        profiles = profilesDict
    }
    
    public func firstProducerProfileVerticalHandle() -> String? {
        return self.producerProfile()?.keys.first
    }
    public func firstProducerProfile() -> ProducerProfile? {

        let values = self.producerProfile()?.values

        return values?.first
    }
    
    public func verticalHandle() -> String? {
        return self.producerProfile()?.keys.first
    }
    
    public func userId() -> String? {
        return jsonUser["id"].string
    }
    
    public func username() -> String? {
        return jsonUser["username"].string
    }
    
    public func firstName() -> String? {
        return firstProducerProfile()?.firstName()
    }
    public func lastName() -> String? {
        return firstProducerProfile()?.lastName()
    }
    
    public func charityDisplayName() -> String? {
        return firstProducerProfile()?.charityCards()?.first?.displayName()
    }
    
    public func updatePassword(_ newPassword: String?) {
        if let password = newPassword {
            var jsonCopy:JSON = self.jsonUser
            
            jsonCopy["password"] = JSON(password)
            
            self.jsonUser = jsonCopy
        }
    }
    
    public func email() -> String? {
        return jsonUser["email"].string
    }
    
    public func updateEmail(_ newEmail: String?) {
        var jsonCopy:JSON = jsonUser                // ensure that json object is actually Mutable
        
        jsonCopy["email"] = JSON(newEmail!)
        
        self.jsonUser = jsonCopy
    }
    
//    func socialCard() -> PlayerProfileSocialCard? {
//        if (self.jsonUser["social"].isEmpty) { return nil }
//
//        return JSONBackedPlayerProfileSocialCard(json: self.jsonUser["social"])
//    }

    public func maxRecordingTimeInSeconds() -> Float? {
        var maxRecordingTime:Float? = nil
        for (_, profileJson):(String, JSON) in jsonUser["producerProfile"] {
            if let maxTime = profileJson["capabilities"]["maxRecordTimeInSeconds"].float {
                maxRecordingTime = maxTime
            }
        }
        return maxRecordingTime
    }
    
    public func producerProfile() -> Dictionary<String, ProducerProfile>? {
        return profiles
    }
    
    public func toJSON() -> JSON? {
        var jsonCopy:JSON = self.jsonUser
        
        // force update all needed json
        if let profiles = self.producerProfile() {
            for (verticalHandle, profile) in profiles {
                jsonCopy["producerProfile"][verticalHandle] = profile.toJSON()
            }
        }
        
        return jsonCopy
    }
}
