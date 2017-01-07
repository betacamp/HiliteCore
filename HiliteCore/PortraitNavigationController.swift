import Foundation
import UIKit

open class PortraitNavigationController: HLNavigationController {
    override open var preferredInterfaceOrientationForPresentation : UIInterfaceOrientation {
        return UIInterfaceOrientation.portrait
    }
}
