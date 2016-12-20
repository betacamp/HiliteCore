import Foundation
import SwiftyJSON

typealias UserId = String

protocol UserIdentityCard {
    func userId() -> UserId?
    func username() -> String?
    func email() -> String?
    func firstName() -> String?
    func lastName() -> String?
    func updateEmail(_ newEmail: String?)
    func maxRecordingTimeInSeconds() -> Float?
    func producerProfile() -> Dictionary<String, ProducerProfile>?
    func charityDisplayName() -> String? 
    func firstProducerProfile() -> ProducerProfile?
    func firstProducerProfileVerticalHandle() -> String?
    func updatePassword(_ newPassword: String?)
    func verticalHandle() -> String?
//    func socialCard() -> PlayerProfileSocialCard?
    
    func toJSON() -> JSON?
}
