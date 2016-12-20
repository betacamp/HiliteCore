import Foundation

public class HiliteError: NSError {
    public class func create(_ code: Int!, description: String!) -> HiliteError {
        return HiliteError(domain: "com.birdtree.Hilite", code: code, userInfo: [NSLocalizedDescriptionKey: description])
    }
}
