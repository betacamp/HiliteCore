import Foundation

typealias TaskId = String

protocol Task: FeedItem {
    func id() -> TaskId?
    func teleprompterText() -> String?
    func purchaser() -> Purchaser?
    func recipient() -> Recipient?
    func profileImageUrl() -> URL?
    func organizationName() -> String?
}
