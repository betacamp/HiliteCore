import Foundation

public enum BroadcastServiceUserKey : NSString {
    case uploadProgress = "com.birdtree.hilite.BroadcastServiceUserKey.UploadProgress",
         pendingUploadUniqueIdentifier = "com.birdtree.hilite.BroadcastServiceUserKey.PendingUploadUniqueIdentifier"
}

open class BroadcastService {
    fileprivate var observers: [AnyObject] = []
    
    deinit {
        deregisterObservers()
    }
    
    public func deregisterObservers() {
        for observer in observers {
            NotificationCenter.default.removeObserver(observer)
        }
        observers = []
    }
    
    public class func notificationNameForUploadProgressUpdate(_ pendingUpload: PendingUpload!) -> String {
        return "\(baseNotificationName()).UploadProgressUpdate.\(pendingUpload.uniqueIdentifier!)"
    }

    public class func notificationNameForUploadComplete() -> String {
        return "\(baseNotificationName()).UploadComplete"
    }
    
    public class func notificationNameForUploadBegan(_ pendingUpload: PendingUpload!) -> String {
        return "\(baseNotificationName()).UploadBegan.\(pendingUpload.uniqueIdentifier!)"
    }
    
    public class func notificationNameForUploadBegan() -> String {
        return "\(baseNotificationName()).UploadBegan"
    }
    
    public class func notificationNameForUploadCancelled(_ pendingUpload: PendingUpload!) -> String {
        return "\(baseNotificationName()).UploadCancelled.\(pendingUpload.uniqueIdentifier!)"
    }
    
    public class func baseNotificationName() -> String {
        return "com.birdtree.hilite.Notification.name"
    }

    public class func postUploadBegan(_ pendingUpload: PendingUpload) {
        print("posting UploadBegan...")
        
        let dict = NSDictionary(object: pendingUpload.uniqueIdentifier!, forKey: BroadcastServiceUserKey.pendingUploadUniqueIdentifier.rawValue)
        NotificationCenter.default.post(name: Notification.Name(rawValue: notificationNameForUploadBegan(pendingUpload)), object: nil, userInfo: dict as? [AnyHashable: Any])
        NotificationCenter.default.post(name: Notification.Name(rawValue: notificationNameForUploadBegan()), object: nil, userInfo: dict as? [AnyHashable: Any])
    }
    
    public class func postUploadCancelled(_ pendingUpload: PendingUpload) {
        let dict = NSDictionary(object: pendingUpload.uniqueIdentifier!, forKey: BroadcastServiceUserKey.pendingUploadUniqueIdentifier.rawValue)
        NotificationCenter.default.post(name: Notification.Name(rawValue: notificationNameForUploadCancelled(pendingUpload)), object: nil, userInfo: dict as? [AnyHashable: Any])
    }
    
    public class func postUploadComplete(_ pendingUpload: PendingUpload) {
        let dict = NSDictionary(object: pendingUpload.uniqueIdentifier!, forKey: BroadcastServiceUserKey.pendingUploadUniqueIdentifier.rawValue)
        NotificationCenter.default.post(name: Notification.Name(rawValue: notificationNameForUploadComplete()), object: nil, userInfo: dict as? [AnyHashable: Any])
    }

    public class func postUploadProgressUpdate(_ pendingUpload: PendingUpload!, progress: Float) {
        let dict = NSDictionary(object: progress, forKey: BroadcastServiceUserKey.uploadProgress.rawValue)
        NotificationCenter.default.post(name: Notification.Name(rawValue: notificationNameForUploadProgressUpdate(pendingUpload)), object: nil, userInfo: dict as? [AnyHashable: Any])
    }

    // TODO: should also have onUploadComplete(pendingUpload)
    public func onUploadComplete(_ block: @escaping ((Notification!)->())) {
        let observer = NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: BroadcastService.notificationNameForUploadComplete()), object: nil, queue: nil, using: block)
        observers.append(observer)
    }

    public func onUploadProgressUpdate(_ pendingUpload: PendingUpload!, block: @escaping ((Notification!)->())) {
        let observer = NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: BroadcastService.notificationNameForUploadProgressUpdate(pendingUpload)), object: nil, queue: nil, using: block)
        observers.append(observer)
    }
    
    public func onUploadBegan(_ block: @escaping (Notification!)->()) {
        let observer = NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: BroadcastService.notificationNameForUploadBegan()), object: nil, queue: nil, using: block)
        self.observers.append(observer)
    }

    public func onUploadBegan(_ pendingUpload: PendingUpload?, block: @escaping (Notification!)->()) {
        
        guard let pendingUpload = pendingUpload else { return }
        
        let name = NSNotification.Name(BroadcastService.notificationNameForUploadBegan(pendingUpload))
        let observer = NotificationCenter.default.addObserver(forName: name, object: nil, queue: nil, using: block)
        observers.append(observer)

    }
    public func onUploadCancelled(_ pendingUpload: PendingUpload?, block: @escaping (Notification!)->()) {
        
        guard let pendingUpload = pendingUpload else { return }
        
        let name = NSNotification.Name(BroadcastService.notificationNameForUploadCancelled(pendingUpload))
        let observer = NotificationCenter.default.addObserver(forName: name, object: nil, queue: nil, using: block)
        observers.append(observer)
    }
}
