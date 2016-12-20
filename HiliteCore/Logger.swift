import Foundation

public class Logger {
    public class func logm(_ msg: String, functionName: String = #function) {
        print("\(functionName): \(msg)", terminator: "\n")
    }
    public class func logm() {
        print("\(#function)", terminator: "\n")
    }
    
    public class func loge(_ msg: String, functionName: String = #function) {
        print("\(functionName): [ERROR] \(msg)", terminator: "\n")
    }

    public class func loge(_ error: Error, functionName: String = #function) {
        print("\(functionName): [ERROR] \(error.localizedDescription)", terminator: "\n")
    }

    public class func logv(_ variable: AnyObject!, functionName: String = #function) {
        print("\(functionName) - \(variable)", terminator: "\n")
    }
}
