import Foundation
import UIKit

open class BaseViewController: UIViewController {
    open var backgroundImageView:ImageView!
    
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override open func loadView() {

        self.view = UIView()
        self.view.backgroundColor = HLColor.black
        self.view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight];
        self.edgesForExtendedLayout = UIRectEdge()
        
        backgroundImageView = ImageView(image: AssetManager.applicationBackgroundImage())
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.contentMode = .scaleAspectFill
        self.view.addSubview(backgroundImageView)
        
        backgroundImageView.attachToBoundsOfView(self.view).addConstraintsToView(self.view)
    }
    
    open func subscribeToKeyboardEvents() {
        NotificationCenter.default.addObserver(self, selector: #selector(BaseViewController.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BaseViewController.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    open func unsubscribeToKeyboardEvents() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    open func keyboardWillShow(_ notification: Notification) {
        // should be overriden
    }
    open func keyboardWillHide(_ notification: Notification) {
        // should be overriden
    }    
}
