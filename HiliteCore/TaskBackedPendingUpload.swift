import Foundation
import SwiftyJSON

open class TaskBackedPendingUpload: PendingUpload {
    public var task: Task!
    public var capturedVideo: CapturedVideo!
    public var _uploadProgress: Float
    public var fileUrlToMOV:URL? {
        get {
            return capturedVideo.fileUrlToMOV as URL?
        } set(newUrl) {
        }
    }
    public var uniqueIdentifier:String? {
        get {
            return task.id()
        } set(newUniqueIdentifier) { }
    }
    public var isUploaded:Bool
    
    public init(task: Task!, capturedVideo: CapturedVideo!, isUploaded: Bool) {
        self.isUploaded = isUploaded
        self.task = task
        self.capturedVideo = capturedVideo
        self._uploadProgress = 0.0
    }
    
    public func setUploadProgress(_ progress: Float) {
        self._uploadProgress = progress
    }
    public func uploadProgress() -> Float {
        return self._uploadProgress
    }
    
    public func teleprompterText() -> String? {
        return task.teleprompterText()
    }
    public func purchaser() -> Purchaser? {
        return task.purchaser()
    }
    public func recipient() -> Recipient? {
        return task.recipient()
    }
    
    public func toJSON() -> JSON! {
        let dict = NSMutableDictionary()
        
        dict.setObject(task.id()!, forKey: "uniqueIdentifier" as NSCopying)
        dict.setObject(isUploaded, forKey: "isUploaded" as NSCopying)
        dict.setObject(capturedVideo.fileUrlToMOV!.absoluteString, forKey: "fileUrlToMOV" as NSCopying)
        dict.setObject(teleprompterText() ?? "", forKey: "teleprompter" as NSCopying)
        dict.setObject(self.purchaser()?.displayName() ?? "", forKey: "purchaserDisplayName" as NSCopying)
        dict.setObject(self.recipient()?.displayName() ?? "", forKey: "recipientDisplayName" as NSCopying)
        dict.setObject(uploadProgress(), forKey: "uploadProgress" as NSCopying)
        
        if let orgName = organizationName() {
            dict.setObject(orgName, forKey: "organizationName" as NSCopying)
        }
        
        return JSON(dict)
    }
    
    public func completeUpload() {
        self.isUploaded = true
    }
    
    public func organizationName() -> String? {
        return task.organizationName()
    }
}
