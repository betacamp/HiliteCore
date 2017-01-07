import Foundation

public protocol Suspendable: AnyObject {
    func suspend()
    func resume()
}
