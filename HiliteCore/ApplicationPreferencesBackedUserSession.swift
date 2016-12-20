import Foundation

public class ApplicationPreferencesBackedUserSession: UserSession {
    
    public init() { }
    
    public func loginWithUserId(_ userId: String?, username: String?, password: String?, firstName: String?, lastName: String?, charityDisplayName: String?, verticalHandle: String?) {
        if let unwrappedUserId = userId {
            ApplicationPreferences().setUserId(unwrappedUserId)
        }
        if let unwrappedUsername = username {
            ApplicationPreferences().setUsername(unwrappedUsername)
        }
        if let unwrappedPassword = password {
            ApplicationPreferences().setPassword(unwrappedPassword)
        }
        if let unwrappedFirstName = firstName {
            ApplicationPreferences().setFirstName(unwrappedFirstName)
        }
        if let unwrappedLastName = lastName {
            ApplicationPreferences().setLastName(unwrappedLastName)
        }
        if let unwrappedCharityDisplayName = charityDisplayName {
            ApplicationPreferences().setCharityDisplayName(unwrappedCharityDisplayName)
        }
        if let unwrappedVerticalHandle = verticalHandle {
            ApplicationPreferences().setVerticalHandle(unwrappedVerticalHandle)
        }
        
        UserDefaults.standard.synchronize()
    }
    
    public func isConsumer() -> Bool {
        return (self.verticalHandle() ?? "") == "consumer"
    }
    public func loginWithUserIdentityCard(_ userIdentityCard: UserIdentityCard) {
        self.loginWithUserId(userIdentityCard.userId(), username: userIdentityCard.username(), password: nil, firstName: userIdentityCard.firstName(), lastName: userIdentityCard.lastName(), charityDisplayName: userIdentityCard.charityDisplayName(), verticalHandle: userIdentityCard.verticalHandle())
    }
    
    public func verticalHandle() -> String? {
        return ApplicationPreferences().verticalHandle()
    }
    
    public func fullName() -> String! {
        let fName = firstName() ?? ""
        let lName = lastName() ?? ""
        return "\(fName) \(lName)"
    }
    
    public func charityDisplayName() -> String? {
        return ApplicationPreferences().charityDisplayName()
    }
    
    public func logout() {
        ApplicationPreferences().reset()
    }
    
    public func isLoggedIn() -> Bool {
        return userId() != nil
    }
    
    public func userId() -> String? {
        return ApplicationPreferences().userId()
    }
    public func username() -> String? {
        return ApplicationPreferences().username()
    }
    public func password() -> String? {
        return ApplicationPreferences().password()
    }
    public func firstName() -> String? {
        return ApplicationPreferences().firstName()
    }
    public func lastName() -> String? {
        return ApplicationPreferences().lastName()
    }
    public func updateDeviceToken(_ deviceToken: String!) {
        ApplicationPreferences().setDeviceToken(deviceToken)
    }
    public func deviceToken() -> String? {
        return ApplicationPreferences().deviceToken()
    }
}
