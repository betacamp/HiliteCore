import Foundation

public protocol UserSession {
    func loginWithUserIdentityCard(_ userIdentityCard: UserIdentityCard)
    func loginWithUserId(_ userId: String?, username: String?, password: String?, firstName: String?, lastName: String?, charityDisplayName: String?, verticalHandle: String?) -> Void
    func firstName() -> String?
    func lastName() -> String?
    func fullName() -> String!
    func charityDisplayName() -> String?
    func logout() -> Void
    func isLoggedIn() -> Bool
    func verticalHandle() -> String?
    
    func userId() -> String?
    func deviceToken() -> String?
    
    func isConsumer() -> Bool
}
