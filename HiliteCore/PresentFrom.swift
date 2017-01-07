import Foundation
import UIKit

public protocol PresentFrom {
    func present(_ viewController: UIViewController!)
    func presentModally(_ viewController: UIViewController!)
}
