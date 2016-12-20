import Foundation

let PREF_KEY_USER_USER_ID = "User.userId"
let PREF_KEY_USER_USERNAME = "User.username"
let PREF_KEY_USER_FIRST_NAME = "User.firstName"
let PREF_KEY_USER_LAST_NAME = "User.lastName"
let PREF_KEY_USER_PASSWORD = "User.password"
let PREF_KEY_DEVICE_TOKEN = "User.deviceToken"
let PREF_KEY_MAX_RECORD_TIME_IN_SECONDS = "User.maxRecordTimeInSeconds"
let PREF_KEY_USER_CHARITY_DISPLAY_NAME = "User.charityDisplayName"
let PREF_KEY_USER_VERTICAL_HANDLE = "User.verticalHandle"

public class ApplicationPreferences {
    public func reset() {
        clearUserId()
        clearUsername()
        clearPassword()
        clearFirstName()
        clearLastName()
        clearCharityDisplayName()
        clearMaxRecordTimeInSeconds()
        clearVerticalHandle()
        
        UserDefaults.standard.synchronize()
        
        // we're not clearing device token on purpose!
    }

    public func setCharityDisplayName(_ charityDisplayName: String) {
        UserDefaults.standard.setValue(charityDisplayName, forKey: PREF_KEY_USER_CHARITY_DISPLAY_NAME);
    }
    public func charityDisplayName() -> String? {
        return UserDefaults.standard.value(forKey: PREF_KEY_USER_CHARITY_DISPLAY_NAME) as? String
    }
    
    public func setUserId(_ userId: String) {
        UserDefaults.standard.setValue(userId, forKey: PREF_KEY_USER_USER_ID)
    }
    public func userId() -> String? {
        return UserDefaults.standard.value(forKey: PREF_KEY_USER_USER_ID) as? String
    }
    public func clearUserId() {
        UserDefaults.standard.removeObject(forKey: PREF_KEY_USER_USER_ID)
    }

    public func setFirstName(_ firstName: String) {
        UserDefaults.standard.setValue(firstName, forKey: PREF_KEY_USER_FIRST_NAME)
    }
    public func firstName() -> String? {
        return UserDefaults.standard.value(forKey: PREF_KEY_USER_FIRST_NAME) as? String
    }

    public func setVerticalHandle(_ verticalHandle: String) {
        UserDefaults.standard.setValue(verticalHandle, forKey: PREF_KEY_USER_VERTICAL_HANDLE)
    }
    
    public func verticalHandle() -> String? {
        return UserDefaults.standard.value(forKey: PREF_KEY_USER_VERTICAL_HANDLE) as? String
    }
    
    public func setLastName(_ lastName: String) {
        UserDefaults.standard.setValue(lastName, forKey: PREF_KEY_USER_LAST_NAME);
    }
    public func lastName() -> String? {
        return UserDefaults.standard.value(forKey: PREF_KEY_USER_LAST_NAME) as? String
    }

    public func setUsername(_ username: String) {
        UserDefaults.standard.setValue(username, forKey: PREF_KEY_USER_USERNAME);
    }
    public func username() -> String? {
        return UserDefaults.standard.value(forKey: PREF_KEY_USER_USERNAME) as? String;
    }
    public func clearUsername() {
        UserDefaults.standard.removeObject(forKey: PREF_KEY_USER_USERNAME);
    }

    public func setPassword(_ password: String) {
        UserDefaults.standard.setValue(password, forKey: PREF_KEY_USER_PASSWORD);
    }
    public func password() -> String? {
        return UserDefaults.standard.value(forKey: PREF_KEY_USER_PASSWORD) as? String;
    }
    public func clearCharityDisplayName() {
        UserDefaults.standard.removeObject(forKey: PREF_KEY_USER_CHARITY_DISPLAY_NAME);
    }
    public func clearPassword() {
        UserDefaults.standard.removeObject(forKey: PREF_KEY_USER_PASSWORD);
    }
    public func clearFirstName() {
        UserDefaults.standard.removeObject(forKey: PREF_KEY_USER_FIRST_NAME);
    }
    public func clearLastName() {
        UserDefaults.standard.removeObject(forKey: PREF_KEY_USER_LAST_NAME);
    }
    public func setMaxRecordTimeInSeconds(_ seconds: Float) {
        UserDefaults.standard.setValue(seconds, forKey: PREF_KEY_MAX_RECORD_TIME_IN_SECONDS);
    }
    public func maxRecordTimeInSeconds() -> Float? {
        return UserDefaults.standard.value(forKey: PREF_KEY_MAX_RECORD_TIME_IN_SECONDS) as? Float
    }
    public func clearVerticalHandle() {
        UserDefaults.standard.removeObject(forKey: PREF_KEY_USER_VERTICAL_HANDLE)
    }
    public func clearMaxRecordTimeInSeconds() {
        UserDefaults.standard.removeObject(forKey: PREF_KEY_MAX_RECORD_TIME_IN_SECONDS);
    }
    public func clearDeviceToken() {
        UserDefaults.standard.removeObject(forKey: PREF_KEY_DEVICE_TOKEN)
    }
    public func deviceToken() -> String? {
        return UserDefaults.standard.value(forKey: PREF_KEY_DEVICE_TOKEN) as? String
    }
    public func setDeviceToken(_ deviceToken: String!) {
        UserDefaults.standard.setValue(deviceToken, forKey: PREF_KEY_DEVICE_TOKEN)
    }
}
