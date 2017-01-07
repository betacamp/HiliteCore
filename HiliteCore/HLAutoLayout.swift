import Foundation
import UIKit

let AUTO_LAYOUT_CONSTRAINT_KEY:NSString = "kAutoLayoutConstraintKey"

extension UIView {
    var autoLayoutConstraints: Array<NSLayoutConstraint>? {
        get {
            return getAssociatedObject(object: self, key: AUTO_LAYOUT_CONSTRAINT_KEY) as? Array<NSLayoutConstraint>
        }
        set(newAutoLayoutConstraints) {
            setAssociatedObject(object: self, key: AUTO_LAYOUT_CONSTRAINT_KEY, value: newAutoLayoutConstraints as NSObject?);
        }
    }
    
    func attachToBoundsOfView(_ view: UIView!) -> UIView! {
        addToConstraints(constraintForTopOfView(self, attachedToTopOfView:view, offset: 0))
        addToConstraints(constraintForRightOfView(self, attachedToRightOfView:view, offset: 0))
        addToConstraints(constraintForBottomOfView(self, attachedToBottomOfView:view, offset: 0))
        addToConstraints(constraintForLeftOfView(self, attachedToLeftOfView:view, offset: 0))
        return self;
    }

    func attachRightToCenterXOfView(_ view: UIView!, offset: CGFloat) -> UIView! {
        addToConstraints(constraintForRightOfView(self, attachToCenterXOfView:view, offset: offset))
        return self
    }
    
    func attachLeftToCenterXOfView(_ view: UIView!, offset: CGFloat) -> UIView! {
        addToConstraints(constraintForLeftOfView(self, attachToCenterXOfView:view, offset: offset))
        return self
    }
    
    func attachBottomToCenterYOfView(_ view: UIView!, offset: CGFloat) -> UIView! {
        addToConstraints(constraintForBottomOfView(self, attachedToCenterYOfView: view, offset: offset))
        return self
    }
    
    func attachCenterYToCenterYOfView(_ view: UIView!, offset: CGFloat) -> UIView! {
        addToConstraints(constraintForCenterYOfView(self, attachedToCenterYOfView: view, offset: offset))
        return self
    }
    
    func attachTopToTopOfView(_ view: UIView!, offset: CGFloat) -> UIView! {
        addToConstraints(constraintForTopOfView(self, attachedToTopOfView:view, offset: offset));
        return self
    }
    
    func attachTopToBottomOfView(_ view: UIView!, offset: CGFloat) -> UIView! {
        addToConstraints(constraintForTopOfView(self, attachedToBottomOfView:view, offset: offset));
        return self;
    }
    
    func attachRightToRightOfView(_ view: UIView!, offset: CGFloat) -> UIView! {
        addToConstraints(constraintForRightOfView(self, attachedToRightOfView:view, offset: offset));
        return self;
    }
    
    func attachRightToLeftOfView(_ view: UIView!, offset: CGFloat) -> UIView! {
        addToConstraints(constraintForRightOfView(self, attachedToLeftOfView:view, offset: offset));
        return self;
    }
    
    func attachBottomToBottomOfView(_ view: UIView!, offset: CGFloat) -> UIView! {
        addToConstraints(constraintForBottomOfView(self, attachedToBottomOfView:view, offset: offset));
        return self;
    }
    
    func attachBottomToTopOfView(_ view: UIView!, offset: CGFloat) -> UIView! {
        addToConstraints(constraintForBottomOfView(self, attachedToTopOfView: view, offset: offset))
        return self;
    }
    
    func attachLeftToLeftOfView(_ view: UIView!, offset: CGFloat) -> UIView! {
        addToConstraints(constraintForLeftOfView(self, attachedToLeftOfView:view, offset: offset));
        return self;
    }
    
    func attachLeftToLeftOfView(_ view: UIView!, multiplier: CGFloat) -> UIView! {
        addToConstraints(constraintForLeftOfView(self, attachedToLeftOfView:view, multiplier: multiplier));
        return self;
    }
    
    func attachLeftToRightOfView(_ view: UIView!, offset: CGFloat) -> UIView! {
        addToConstraints(constraintForLeftOfView(self, attachedToRightOfView:view, offset: offset));
        return self;
    }
    
    func attachWidth(_ width: CGFloat) -> UIView! {
        addToConstraints(constraintForWidthOfView(self, width: width));
        return self;
    }
    
    func attachWidthToWidthOfView(_ view: UIView!, multiplier: CGFloat) -> UIView! {
        addToConstraints(constraintForWidthOfView(self, attachedToWidthOfView:view, multiplier: multiplier));
        return self;
    }
    
    func attachHeight(_ height: CGFloat) -> UIView! {
        addToConstraints(constraintForHeightOfView(self, height: height));
        return self;
    }
    
    func attachHeightToHeightOfView(_ view: UIView!) -> UIView! {
        addToConstraints(constraintForHeightOfView(self, attachToHeightOfView: view));
        return self;
    }

    func attachCenterXToView(_ view: UIView!) -> UIView! {
        return attachCenterXToView(view, offset: 0.0)
    }
    
    func attachCenterXToView(_ view: UIView!, offset: CGFloat) -> UIView! {
        addToConstraints(constraintForCenterXOfView(self, attachedToCenterXOfView:view, offset: offset))
        return self
    }
    
    func addConstraintsToView(_ view: UIView!) {
        if let _ = autoLayoutConstraints {
            for constraint in view.constraints {
                if (constraint.firstItem as! UIView == self) {
                    view.removeConstraint(constraint );
//                    (constraint as! NSLayoutConstraint).active = false
                }
            }
            view.addConstraints(autoLayoutConstraints!)
            view.setNeedsUpdateConstraints()
            view.setNeedsLayout()
        }
    }
    
    fileprivate func addToConstraints(_ constraint: NSLayoutConstraint) {
        if (self.autoLayoutConstraints == nil) {
            autoLayoutConstraints = Array<NSLayoutConstraint>()
        }
        autoLayoutConstraints?.append(constraint);
    }
    
    fileprivate func constraintForBottomOfView(_ view: UIView!, attachedToCenterYOfView: UIView!, offset: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: attachedToCenterYOfView, attribute: NSLayoutAttribute.centerY, multiplier: 1.0, constant: offset)
    }
    
    fileprivate func constraintForCenterXOfView(_ view: UIView!, attachedToCenterXOfView: UIView!, offset: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: attachedToCenterXOfView, attribute: NSLayoutAttribute.centerX, multiplier: 1.0, constant: offset)
    }
    
    fileprivate func constraintForCenterYOfView(_ view: UIView!, attachedToCenterYOfView: UIView!, offset: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: attachedToCenterYOfView, attribute: NSLayoutAttribute.centerY, multiplier: 1.0, constant: offset)
    }
    
    fileprivate func constraintForTopOfView(_ topOfView: UIView!, attachedToTopOfView: UIView!, offset: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: topOfView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: attachedToTopOfView, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: offset);
    }

    fileprivate func constraintForTopOfView(_ topOfView: UIView!, attachedToBottomOfView: UIView!, offset: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: topOfView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: attachedToBottomOfView, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: offset);
    }
    
    fileprivate func constraintForRightOfView(_ rightOfView: UIView!, attachedToRightOfView: UIView!, offset: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: rightOfView, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: attachedToRightOfView, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: offset);
    }

    fileprivate func constraintForRightOfView(_ rightOfView: UIView!, attachedToLeftOfView: UIView!, offset: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: rightOfView, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: attachedToLeftOfView, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: offset);
    }
    
    fileprivate func constraintForRightOfView(_ rightOfView: UIView!, attachToCenterXOfView: UIView!, offset: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: rightOfView, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: attachToCenterXOfView, attribute: NSLayoutAttribute.centerX, multiplier: 1.0, constant: offset)
    }
    
    fileprivate func constraintForLeftOfView(_ leftOfView: UIView!, attachToCenterXOfView: UIView!, offset: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: leftOfView, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: attachToCenterXOfView, attribute: NSLayoutAttribute.centerX, multiplier: 1.0, constant: offset)
    }
    
    fileprivate func constraintForBottomOfView(_ view: UIView!, attachedToBottomOfView: UIView!, offset: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: attachedToBottomOfView, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: offset);
    }

    fileprivate func constraintForBottomOfView(_ view: UIView!, attachedToTopOfView: UIView!, offset: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: attachedToTopOfView, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: offset);
    }
    
    fileprivate func constraintForLeftOfView(_ leftOfView: UIView!, attachedToLeftOfView: UIView!, offset: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: leftOfView, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: attachedToLeftOfView, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: offset);
    }

    fileprivate func constraintForLeftOfView(_ leftOfView: UIView!, attachedToLeftOfView: UIView!, multiplier: CGFloat) -> NSLayoutConstraint {
        if (multiplier == 0 || attachedToLeftOfView == nil) {
            return NSLayoutConstraint(item: leftOfView, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: attachedToLeftOfView, attribute: NSLayoutAttribute.width, multiplier: 1.0, constant: 0);
        } else {
            return NSLayoutConstraint(item: leftOfView, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: attachedToLeftOfView, attribute: NSLayoutAttribute.width, multiplier: multiplier, constant: 0);
        }
    }
    
    fileprivate func constraintForLeftOfView(_ leftOfView: UIView!, attachedToRightOfView: UIView!, offset: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: leftOfView, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: attachedToRightOfView, attribute: NSLayoutAttribute.right, multiplier: 1.0, constant: offset);
    }
    
    fileprivate func constraintForWidthOfView(_ view: UIView!, width: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: width);
    }

    fileprivate func constraintForWidthOfView(_ view: UIView!, attachedToWidthOfView: UIView!, multiplier: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: attachedToWidthOfView, attribute: NSLayoutAttribute.width, multiplier: multiplier, constant: 0.0);
    }
    
    fileprivate func constraintForHeightOfView(_ view: UIView!, height: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: height);
    }

    fileprivate func constraintForHeightOfView(_ view: UIView!, attachToHeightOfView: UIView!) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: attachToHeightOfView, attribute: NSLayoutAttribute.height, multiplier: 1.0, constant: 0.0);
    }
}
