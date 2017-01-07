import Foundation

public func setAssociatedObject(object: NSObject, key: NSString, value: NSObject?) {
//    setAssociatedObject_glue(object, key as String, value)
    objc_setAssociatedObject(object, key as String, value, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
}

public func getAssociatedObject(object: NSObject, key: NSString) -> NSObject? {
//    return getAssociatedObject_glue(object, key as String)
    return objc_getAssociatedObject(object, key as String) as? NSObject
}
