import Foundation

public class APIv1 {
    let env: Environment!
    
    public init() {
        env = Environment();
    }
    
    // TODO: remove!
//    func updatePlayerUrl(userId: UserId!) -> NSURL? {
//        return baseServicesUrl()?.URLByAppendingPathComponent("/nfl/player/\(userId)")
//    }
    
    public func forgotPasswordUrl() -> URL? {
        return baseServicesUrl()?.appendingPathComponent("/auth/forgot")
    }
    
    public func userAuthUrl() -> URL? {
        return baseServicesUrl()?.appendingPathComponent("/auth/local");
    }
    
    public func verifyUserUrl() -> URL? {
        return baseServicesUrl()?.appendingPathComponent("/auth/session/verify")
    }
    
    public func userVerifySessionUrl() -> URL? {
        return baseServicesUrl()?.appendingPathComponent("/auth/session/verify");
    }
    
    public func baseServicesUrl() -> URL? {
        return URL(string: "https://"+env.servicesHost()!)?.appendingPathComponent("v1");
    }
    
    // TODO: DEPRECATED
//    func playerProfileUrl(playerId: String!) -> NSURL? {
//        return baseServicesUrl()?.URLByAppendingPathComponent("/nfl/player/\(playerId)/profile")
//    }

    // TODO: DEPRECATED
//    func updatePlayerProfileUrl(playerId: String!) -> NSURL? {
//        return baseServicesUrl()?.URLByAppendingPathComponent("/nfl/player/\(playerId)/profile")
//    }
    
    public func followAyoOnTwitterUrl() -> URL? {
        let screenName = "HiLiteBrand"
        return URL(string: "https://api.twitter.com/1.1/friendships/create.json?screen_name=\(screenName)&follow=true")
    }
}
