import Foundation

public protocol FileManager {
    func fileUrlToTemporaryFileWithFilename(_ filename: String) -> URL
    func removeFileAtUrl(_ url: URL!)
    func fileExistsAtUrl(_ url: URL!) -> Bool
    func fileUrlToDocumentsFolder() -> URL
    func writeData(_: Data!, toFileAtUrl: URL!) -> Bool
    func createFolderAtUrl(_ url: URL!) -> Bool
    func fileContentsAtUrl(_ url: URL!) -> Data?
}
