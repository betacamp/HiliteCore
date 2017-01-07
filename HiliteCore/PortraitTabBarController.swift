import Foundation
import UIKit

open class PortraitTabBarController: UITabBarController {
    override open var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override open var preferredInterfaceOrientationForPresentation : UIInterfaceOrientation {
        return UIInterfaceOrientation.portrait
    }
    
    override open var shouldAutorotate : Bool {
        return false
    }
}
