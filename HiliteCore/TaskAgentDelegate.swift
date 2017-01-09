import Foundation

public protocol TaskAgentDelegate {
    func taskAgentWantsToLaunchRecorder(_ taskAgent: TaskAgent, presentFrom: PresentFrom)
}
