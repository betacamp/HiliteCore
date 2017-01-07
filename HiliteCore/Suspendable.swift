import Foundation

protocol Suspendable: AnyObject {
    func suspend()
    func resume()
}