import Foundation
import SwiftyJSON

public protocol PendingUpload {
    var isUploaded:Bool { get set }
    var fileUrlToMOV:URL? { get set }
    var uniqueIdentifier:String? { get set }
    
    func setUploadProgress(_ progress: Float)
    func uploadProgress() -> Float
    func teleprompterText() -> String?
    func purchaser() -> Purchaser?
    func recipient() -> Recipient?
    func toJSON() -> JSON!
    func completeUpload()
    func organizationName() -> String?
}
