import Foundation
import SwiftyJSON

public protocol ProducerProfile {
    func displayName() -> String?
    func firstName() -> String?
    func lastName() -> String?
    func charityCards() -> Array<CharityIdentityCard>?
    func updateCharityIds(_ newCharityIds: [String?]!)
    func phoneNumber() -> String?
    func updatePhoneNumber(_ newPhoneNumber: String?)
    func socialCard() -> PlayerProfileSocialCard?
    func signatureImageUrl() -> URL?
    func profilePhotoUrl() -> URL?
    func updateProfilePhotoUrl(_ newUrl: URL?)
    func updateSignatureImageUrl(_ url: URL?)
    func welcomePageUrl() -> URL?
    func producerTermsUrl() -> URL?
    func onboardingComplete() -> Bool
    func donationFactor() -> Double?
    func updateDonationFactor(_ newDonationFactor: Double!)
    func supportContactEmail() -> String?
    func supportContactPhoneNumber() -> String?
    func stats() -> ProducerProfileStats?
    
    func toJSON() -> JSON!
}
