import Foundation

open class HLFileManager: FileManager {
    let fileManager: Foundation.FileManager!
    
    public init() {
        self.fileManager = Foundation.FileManager.default
    }
    
    public func fileUrlToTemporaryFileWithFilename(_ filename: String) -> URL {
        let path:String = "\(NSTemporaryDirectory())\(filename)"
        return URL(fileURLWithPath: path)
    }
    
    public func fileUrlToDocumentsFileWithFilename(_ filename: String) -> URL {
        
        let documentsPath = NSSearchPathForDirectoriesInDomains(Foundation.FileManager.SearchPathDirectory.documentDirectory, Foundation.FileManager.SearchPathDomainMask.userDomainMask, true)[0] 
        
        let fileUrl = URL(fileURLWithPath: documentsPath).appendingPathComponent(filename)
        
        return fileUrl
    }

    public func fileUrlToDocumentsFolder() -> URL {
        let documentsPath = NSSearchPathForDirectoriesInDomains(Foundation.FileManager.SearchPathDirectory.documentDirectory, Foundation.FileManager.SearchPathDomainMask.userDomainMask, true)[0] 
        
        return URL(string: documentsPath)!
    }
    
    public func fileExistsAtUrl(_ url: URL!) -> Bool {
        return fileManager.fileExists(atPath: url.path)
    }
    
    public func removeFileAtUrl(_ url: URL!) {
        if (fileExistsAtUrl(url)) {
            Logger.logm("remove file at URL: \(url)")
            var removeError: NSError?
            do {
                try fileManager.removeItem(atPath: url.path)
            } catch let error as NSError {
                removeError = error
            }
            if let error = removeError {
                Logger.logm(error.localizedDescription)
            }
        }
    }
    
    public func writeData(_ data: Data!, toFileAtUrl: URL!) -> Bool {
        let success = fileManager.createFile(atPath: toFileAtUrl.path, contents: data, attributes: nil)
        return success
    }
    
    public func createFolderAtUrl(_ url: URL!) -> Bool {
        var error:Error?
        
        do {
        
            try fileManager.createDirectory(atPath: url.path, withIntermediateDirectories: true, attributes: nil)
        } catch let error1 as NSError {
            error = error1
        }
        
        if let error = error {
            Logger.loge(error)
        }

        return error != nil
    }
    
    public func fileContentsAtUrl(_ url: URL!) -> Data? {
        return fileManager.contents(atPath: url.path)
    }
}
