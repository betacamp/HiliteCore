import Foundation

public typealias CapturedVideoId = String

open class StandardCapturedVideo: CapturedVideo {
    let fileManager: HLFileManager!
    public let uuid: CapturedVideoId
    public var movFileUrl: URL?
    public var mp4FileUrl: URL?
    public var duration: TimeInterval?
    
    public var durationInSeconds: TimeInterval? {
        get {
            return duration
        }
        set(newDuration) {
            duration = newDuration
        }
    }
    public var fileUrlToMOV: URL? {
        get {
            return movFileUrl
        }
        set(newUrl) {
            movFileUrl = newUrl
        }
    }
    public var fileUrlToMP4: URL? {
        get {
            return mp4FileUrl
        }
        set(newUrl) {
            mp4FileUrl = newUrl
        }
    }
    
    public init() {
        self.fileManager = HLFileManager()
        self.uuid = HLUUIDGenerator.generateUUID()
        
        self.fileUrlToMOV = self.fileManager.fileUrlToDocumentsFileWithFilename("\(self.uuid).mov")
        self.fileUrlToMP4 = self.fileManager.fileUrlToDocumentsFileWithFilename("\(self.uuid).mp4")
//        self.fileUrlToMOV = self.fileManager.fileUrlToTemporaryFileWithFilename("\(self.uuid).mov")
//        self.fileUrlToMP4 = self.fileManager.fileUrlToTemporaryFileWithFilename("\(self.uuid).mp4")
    }
    
    
}
