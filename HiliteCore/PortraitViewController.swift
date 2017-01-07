import Foundation
import UIKit

open class PortraitViewController: BaseViewController {

    override open var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override open var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.default
    }

    override open var preferredInterfaceOrientationForPresentation : UIInterfaceOrientation {
        return UIInterfaceOrientation.portrait
    }

    override open var shouldAutorotate : Bool {
        return false
    }
}
