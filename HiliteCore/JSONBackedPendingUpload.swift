import Foundation
import SwiftyJSON

public class JSONBackedPendingUpload: PendingUpload {
    
    var pendingUploadJson: JSON?

    public init(json: JSON) {
        pendingUploadJson = json
    }

    public func setUploadProgress(_ progress: Float) {
        pendingUploadJson?["uploadProgress"].float = progress
    }
    
    public func uploadProgress() -> Float {
        return pendingUploadJson?["uploadProgress"].float ?? 0.0
    }
    
    public func toJSON() -> JSON! {
        return pendingUploadJson
    }
    
    public func teleprompterText() -> String? {
        return pendingUploadJson?["teleprompter"].string
    }
    
    public func recipient() -> Recipient? {
        return PendingUploadJsonBackedRecipient(pendingUploadJson: pendingUploadJson)
    }
    
    public func purchaser() -> Purchaser? {
        return PendingUploadJsonBackedPurchaser(purchaserJson: pendingUploadJson)
    }

    public var fileUrlToMOV:URL? {
        get {
            guard let urlString = pendingUploadJson?["fileUrlToMOV"].string else { return nil }
            return URL(string: urlString)
        } set(newUrl) {
            pendingUploadJson?["fileUrlToMOV"].string = newUrl!.absoluteString
        }
    }
    public var uniqueIdentifier:String? {
        get {
            return pendingUploadJson?["uniqueIdentifier"].string
        } set(newUniqueIdentifier) {
            pendingUploadJson?["uniqueIdentifier"].string = newUniqueIdentifier
        }
    }
    public var isUploaded:Bool {
        get {
            
          return pendingUploadJson!["isUploaded"].boolValue
        } set(newIsUploaded) {
            pendingUploadJson!["isUploaded"].boolValue = newIsUploaded
        }
    }
    
    public func completeUpload() {
        isUploaded = true
    }
    
    public func organizationName() -> String? {
        return pendingUploadJson?["organizationName"].string
    }
}
