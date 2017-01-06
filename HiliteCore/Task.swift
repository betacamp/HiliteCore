import Foundation

public typealias TaskId = String

public protocol Task: FeedItem {
    func id() -> TaskId?
    func teleprompterText() -> String?
    func purchaser() -> Purchaser?
    func recipient() -> Recipient?
    func profileImageUrl() -> URL?
    func organizationName() -> String?
}
