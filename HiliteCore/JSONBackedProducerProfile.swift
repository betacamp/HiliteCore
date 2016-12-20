import Foundation
import SwiftyJSON

public class JSONBackedProducerProfile: ProducerProfile {
    var json: JSON
    var _socialCard:PlayerProfileSocialCard?
    
    public init(json: JSON!) {
        self.json = json
        
        if (self.json["social"].isEmpty) {
            _socialCard = JSONBackedPlayerProfileSocialCard(json: JSON([:]))
        } else {
            _socialCard = JSONBackedPlayerProfileSocialCard(json: self.json["social"])
        }
    }
    
    public func stats() -> ProducerProfileStats? {
        return JSONBackedProducerProfileStats(json: json["stats"])
    }
    
    public func displayName() -> String? {
        return json["displayName"].string
    }
    
    public func firstName() -> String? {
        return json["firstName"].string
    }

    public func lastName() -> String? {
        return json["lastName"].string
    }

    public func signatureImageUrl() -> URL? {
        if let urlString = self.json["signatureImageUrl"].string {
            return URL(string: urlString)
        }
        
        return nil
    }
    
    public func profilePhotoUrl() -> URL? {
        if let urlString = self.json["profilePhotoUrl"].string {
            return URL(string: urlString)
        }
        
        return nil
    }
    
    public func updateProfilePhotoUrl(_ newUrl: URL?) {
        if let url = newUrl {
            var jsonCopy:JSON = json
            
            jsonCopy["profilePhotoUrl"] = JSON(url.absoluteString)
            
            self.json = jsonCopy
        }
    }
    
    public func donationFactor() -> Double? {
        return json["donationFactor"].double
    }
    
    public func updateDonationFactor(_ newDonationFactor: Double!) {
        var jsonCopy:JSON = self.json

        jsonCopy["donationFactor"].double = newDonationFactor
        
        self.json = jsonCopy
    }

    public func supportContactEmail() -> String? {
        return json["supportContactEmail"].string
    }
    
    public func supportContactPhoneNumber() -> String? {
        return json["supportContactPhoneNumber"].string
    }

    public func welcomePageUrl() -> URL? {
        if let urlString = self.json["welcomePageUrl"].string {
            return URL(string: urlString)
        }
        return nil
    }
    
    public func producerTermsUrl() -> URL? {
        if let urlString = self.json["producerTermsUrl"].string {
            return URL(string: urlString)
        }
        return nil
    }
    
    public func onboardingComplete() -> Bool {
        if let boolValue = json["onboardingComplete"].bool {
            return boolValue
        }
        return false
    }
    
    public func charityCards() -> Array<CharityIdentityCard>? {
        let charitiesJson = json["charities"]
        var cards = Array<CharityIdentityCard>()
        
        for (_, subJson): (String, JSON) in charitiesJson {
            cards.append(JSONBackedCharityIdentityCard(json: subJson))
        }
        
        print(cards, terminator: "")
        
        if (cards.count < 1) { return nil }
        
        return cards
    }
    
    public func updateCharityIds(_ newCharityIds: [String?]!) {
        var jsonCopy:JSON = json
        
        jsonCopy["charityIds"] = JSON(newCharityIds)
        
        self.json = jsonCopy
    }
    
    public func email() -> String? {
        return json["email"].string
    }
    
    public func phoneNumber() -> String? {
        return json["phoneNumber"].string
    }
    
    public func socialCard() -> PlayerProfileSocialCard? {
        return _socialCard
    }
    
    public func updatePhoneNumber(_ newPhoneNumber: String?) {
        if let number = newPhoneNumber {
            self.json["phoneNumber"].string = number
        }
    }
    
    public func updateSignatureImageUrl(_ url: URL?) {
        var jsonCopy:JSON = self.json
        
        jsonCopy["signatureImageUrl"] = JSON(url!.absoluteString)
        
        self.json = jsonCopy
    }
    
    public func toJSON() -> JSON! {
        var jsonCopy:JSON = self.json
        
        if let social = self.socialCard() {
            jsonCopy["social"] = social.toJSON()
        }
        
        return jsonCopy
    }
}
