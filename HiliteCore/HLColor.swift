import Foundation
import UIKit


open class HLColor {
    public static var white: UIColor {
        return UIColor.white
    }
    public static var black: UIColor {
        return UIColor.black
    }
    public static var blueGreen: UIColor {
        return blueGreenColor()
    }
    public static var green: UIColor {
        return greenColor()
    }
    public static var orange: UIColor {
        return orangeColor()
    }
    public static var textFieldBorderColor: UIColor {
        return HLColor.decimalColorWithRed(144, green: 149, blue: 162)
    }
    public static var clear: UIColor {
        return UIColor.clear
    }
    public static var yellow: UIColor {
        return yellowColor()
    }
    public static var darkText: UIColor {
        return UIColor.darkText
    }
    public static var defaultTextColor: UIColor {
        return HLColor.black
    }
    public static var lightGray: UIColor {
        return lightGrayColor()
    }
    public static var red: UIColor {
        return redColor()
    }
    public static var lightText: UIColor {
        return UIColor.lightText
    }
    public static var gray: UIColor {
        return grayColor()
    }
    public static var purple: UIColor {
        return HLColor.decimalColorWithRed(39, green: 23, blue: 56)
    }
    public class func pinkColor() -> UIColor! {
        return HLColor.decimalColorWithRed(210, green: 20, blue: 95)
    }
    public class func orangeColor() -> UIColor! {
        return HLColor.decimalColorWithRed(227, green: 60, blue: 52)
    }
    public class func yellowColor() -> UIColor! {
        return HLColor.decimalColorWithRed(254, green: 252, blue: 0)
    }
    public class func recordButtonProgressColor() -> UIColor! {
        return HLColor.decimalColorWithRed(28, green: 135, blue: 105)
    }
    public class func recordButtonBaseColor() -> UIColor! {
        return HLColor.decimalColorWithRed(44, green: 214, blue: 167)
    }
    public class func redColor() -> UIColor! {
        return HLColor.decimalColorWithRed(255, green: 74, blue: 74)
    }
    
    public class func greenColor() -> UIColor! {
        return HLColor.decimalColorWithRed(134, green: 219, blue: 52)
    }
    public class func blueGreenColor() -> UIColor! {
        return HLColor.decimalColorWithRed(61, green: 191, blue: 113)
    }
    public class func lightBlueColor() -> UIColor! {
        return HLColor.decimalColorWithRed(0, green: 173, blue: 241)
    }
    public class func tabBarTintColor() -> UIColor! {
        return HLColor.decimalColorWithRed(33, green: 33, blue: 33)
    }
    public class func recordingTextColor() -> UIColor! {
        return HLColor.decimalColorWithRed(198, green: 198, blue: 198)
    }
    public class func darkBlueColor() -> UIColor! {
        return HLColor.decimalColorWithRed(20, green: 15, blue: 47)
    }
    public class func blueColor() -> UIColor! {
        return HLColor.decimalColorWithRed(0, green: 173, blue: 241)
    }
    public class func lightGrayColor() -> UIColor! {
        return HLColor.decimalColorWithRed(235, green: 240, blue: 241)
    }
    public class func grayColor() -> UIColor! {
        return HLColor.decimalColorWithRed(123, green: 123, blue: 123)
    }
    public class func darkGrayColor() -> UIColor! {
        return HLColor.decimalColorWithRed(41, green: 40, blue: 44)
    }
    public class func lightBlackColor() -> UIColor! {
        return HLColor.decimalColorWithRed(23, green: 21, blue: 25)
    }
    
    
    public class func decimalColorWithRed(_ red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor! {
        return HLColor.decimalColorWithRed(red, green: green, blue: blue, alpha: 1.0)
    }

    public class func decimalColorWithRed(_ red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor! {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1.0)
    }
}
