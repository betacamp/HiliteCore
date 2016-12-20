import Foundation

public protocol ProducerProfileStats {
    func numberOfPendingTasks() -> Int
    func numberOfFulfilledTasks() -> Int
    func totalAmountRaised() -> Double?
}
