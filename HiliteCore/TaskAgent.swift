import Foundation

public protocol TaskAgent {
    func withTask(_ withTaskBlock: @escaping (Task?)->(), onError: @escaping (Error!)->())
    func launchRecorderFrom(_ presentFrom: PresentFrom)
    func getTask() -> Task?
}
