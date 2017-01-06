//
//  FileBackedCapturedVideo.swift
//  hilite
//
//  Created by Preston Pope on 11/10/16.
//  Copyright © 2016 Center Camp Media LLC. All rights reserved.
//

import Foundation

open class FileBackedCapturedVideo: CapturedVideo {
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
    
    public init(fileUrl: URL!) {
        self.fileManager = HLFileManager()
        self.uuid = HLUUIDGenerator.generateUUID()
        
        guard let videoData = try? Data(contentsOf: fileUrl) else {
            self.fileUrlToMOV = nil
            self.fileUrlToMP4 = nil
            return
        }

        self.fileUrlToMOV = self.fileManager.fileUrlToDocumentsFileWithFilename("\(self.uuid).mov")
        self.fileUrlToMP4 = self.fileUrlToMOV
        
        try! videoData.write(to: self.fileUrlToMOV!, options: Data.WritingOptions.atomic)
    }
}
