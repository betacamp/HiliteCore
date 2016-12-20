import Foundation

public class APIv2 {
    public static let sharedInstance = APIv2()
    let env = Environment()

    public func userSignUpUrl() -> URL? {
        return baseServicesUrl()?.appendingPathComponent("/v2/client/producer")
    }
    
    public func getProducerUrl(_ userId: UserId!) -> URL? {
        return baseServicesUrl()?.appendingPathComponent("/v2/producer/\(userId!)")
    }
    
    public func updateProducerUrl(_ userId: UserId!) -> URL? {
        return baseServicesUrl()?.appendingPathComponent("/v2/producer/\(userId!)")
    }

    public func baseServicesUrl() -> URL? {
        return URL(string: "https://"+env.servicesHost()!);
    }

    public func producerAyosUrl(_ userId: String!) -> URL? {
        return baseServicesUrl()?.appendingPathComponent("/v2/producer/\(userId!)/ayos")
    }
    
    public func initiateProducerSignatureImageUploadUrl(_ userId: String?) -> URL? {
        guard let userId = userId else { return nil }
        
        return baseServicesUrl()?.appendingPathComponent("/v2/producer/\(userId)/initiateSignatureImageUpload")
    }

    public func initiateUploadUrlTaskId(_ taskId: String!) -> URL? {
        return baseServicesUrl()?
            .appendingPathComponent("v2").appendingPathComponent("deliverable").appendingPathComponent(taskId!)
            .appendingPathComponent("initiateUpload")
    }
    
    public func completeUploadUrlWithTaskId(_ taskId: String!) -> URL? {
        return baseServicesUrl()?
            .appendingPathComponent("v2")
            .appendingPathComponent("deliverable")
            .appendingPathComponent(taskId!)
            .appendingPathComponent("completeUpload")
    }
    
    public func searchCharitiesUrlForTerm(_ term: String!, userIdentityCard: UserIdentityCard!) -> URL? {
        let escapedString = term.addingPercentEncoding(withAllowedCharacters: CharacterSet.alphanumerics)
        
        if let escaped = escapedString, let verticalHandle = userIdentityCard.firstProducerProfileVerticalHandle(), let urlString = baseServicesUrl()?.appendingPathComponent("/v2/\(verticalHandle)/charity?search=\(escaped)").absoluteString {
            return URL(string: urlString)
        }
        
        return nil
    }

    public func initiateProducerPhotoUploadUrl(_ userId: String!) -> URL? {
        return baseServicesUrl()?.appendingPathComponent("/v2/producer/\(userId!)/initiatePhotoUpload")
    }

    public func tasksUrlWithUserId(_ userId: String!) -> URL? {
        return baseServicesUrl()?.appendingPathComponent("/v2/producer/\(userId!)/tasks")
    }
    
    public func hiliteTasksUrl() -> URL! {
        let url = baseServicesUrl()!.appendingPathComponent("v2")
        .appendingPathComponent("client")
        .appendingPathComponent("hilite")
        .appendingPathComponent("task")
        .appendingPathComponent("direct")

        //let queryItem = URLQueryItem(name: "token", value: "454365ad-1c12-4df4-80eb-201f66c20320")
        
        //var components = URLComponents()
        //components.scheme = url.scheme
        //components.host = url.host
        //components.path = url.path
        //components.queryItems = [queryItem]
        
        //return components.url!
        
        return url
    }

    public func taskUrlWithTaskId(_ taskId: String!, userId: String!) -> URL? {
        return baseServicesUrl()?.appendingPathComponent("/v2/producer/\(userId!)/task/\(taskId!)")
    }
    
    public func registerDeviceTokenUrl(_ userId: UserId!) -> URL? {
        return baseServicesUrl()?.appendingPathComponent("/v2/producer/\(userId!)/registerIosDeviceToken")
    }
    
    public func unregisterDeviceTokenUrl(_ userId: UserId!) -> URL? {
        return baseServicesUrl()?.appendingPathComponent("/v2/producer/\(userId!)/unregisterIosDeviceToken")
    }

    public func charitiesUrlForVerticalHandle(_ verticalHandle: String!) -> URL? {
        return baseServicesUrl()?.appendingPathComponent("/v2/vertical/\(verticalHandle!)/charities")
    }

    public func supportUrlForUserIdentityCard(_ userIdentityCard: UserIdentityCard!) -> URL? {
        if let verticalHandle = userIdentityCard.producerProfile()?.keys.first {
            return baseServicesUrl()?.appendingPathComponent("/v2/\(verticalHandle)/api/support")
        }
        return nil
    }
    
    public func createCharityUrlWithName(_ name: String!, forUserIdentityCard userIdentityCard: UserIdentityCard?) -> URL? {
        if let userId = userIdentityCard?.userId() {
            return baseServicesUrl()?.appendingPathComponent("/v2/producer/\(userId)/charity")
        }
        return nil
    }
}
