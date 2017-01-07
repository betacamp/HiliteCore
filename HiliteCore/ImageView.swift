import Foundation
import UIKit

open class ImageView: UIImageView, ShowsAsLoading {
    open let spinnerView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.white)
    
    open func showAsLoading(_ loading: Bool) {
        if (loading) {
            self.alpha = 0.6
            self.addSubview(spinnerView)
            spinnerView.center = CGPoint(x: self.bounds.size.width/2.0, y: self.bounds.size.height/2.0)
            spinnerView.startAnimating()
        } else {
            self.alpha = 1.0
            spinnerView.removeFromSuperview()
            spinnerView.stopAnimating()
        }
    }
}
