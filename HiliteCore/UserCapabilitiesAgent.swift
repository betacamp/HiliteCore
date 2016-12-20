import Foundation

public let DEFAULT_MAX_RECORD_TIME_IN_SECONDS:Float = 20

public class UserCapabilitiesAgent {
    public func maxRecordTimeInSeconds() -> Float! {
        return ApplicationPreferences().maxRecordTimeInSeconds() ?? 20
    }
    
    public func updateFromUserIdentityCard(_ userIdentityCard: UserIdentityCard) {
        if let recordTimeInSeconds = userIdentityCard.maxRecordingTimeInSeconds() {
            ApplicationPreferences().setMaxRecordTimeInSeconds(recordTimeInSeconds)
        } else {
            ApplicationPreferences().setMaxRecordTimeInSeconds(20)
        }
    }
}
