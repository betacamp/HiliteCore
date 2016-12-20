import Foundation

public class Environment {
    public let bundleVersion: String
    public let bundleShortVersion: String
    public let configuration: String
    public let environments: NSDictionary
    
    public init() {
        configuration = Bundle.main.infoDictionary?["Configuration"] as! String

        let envsPList = Bundle.main.path(forResource: "Environments", ofType: "plist")!;
        environments = NSDictionary(contentsOfFile:envsPList)!;

        bundleVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String;
        bundleShortVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String;

        print("Version: " + bundleVersion, terminator: "");
    }

    fileprivate func configurationObject() -> [String: AnyObject]? {
        return environments.object(forKey: configuration) as? [String: AnyObject]
    }
    
    public func servicesHost() -> String? {
        return configurationObject()?["servicesHost"] as? String
    }

    public func servicesUrl() -> URL? {
        return URL(string: "http://" + servicesHost()!);
    }

    public func mixpanelToken() -> String? {
        return configurationObject()?["mixpanelToken"] as? String
    }
}
