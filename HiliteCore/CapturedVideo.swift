import Foundation

public protocol CapturedVideo {
    var fileUrlToMOV: URL? { get }
    var fileUrlToMP4: URL? { get }
    var durationInSeconds: TimeInterval? { get set }
    
}
