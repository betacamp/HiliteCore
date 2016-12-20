import Foundation

public protocol PlayerProfileCard {
    func username() -> String?
    func userId() -> String?
    func playerId() -> String?
    func displayName() -> String?
    func jerseyNumber() -> String?
    func charityCards() -> Array<CharityIdentityCard>?
    func stats() -> ProducerProfileStats?
    func teamCard() -> TeamCard?
    func email() -> String?
    func socialCard() -> PlayerProfileSocialCard?
    func profilePhotoUrl() -> URL?
    func donationFactor() -> Double?
    func signatureImageUrl() -> URL?
    func phoneNumber() -> String?
    func onboardingComplete() -> Bool
    func verticalHandle() -> String?
    func producerTermsUrl() -> URL?
    func welcomePageUrl() -> URL?
    func supportContactPhoneNumber() -> String?
    func supportContactEmail() -> String?
}
