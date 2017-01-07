import Foundation
import UIKit

public protocol PresentsViewControllers {
    func presentViewController(_ viewControllerToPresent: UIViewController, animated: Bool, completion: (()->Void)?)
}
