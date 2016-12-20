import Foundation
import SwiftyJSON

public class JSONBackedProducerProfileStats: ProducerProfileStats {
    let json: JSON!
    
    public init(json: JSON!) {
        self.json = json
        
        print("******************************************************************************************************************************")
        print(json)
    }
    
    public func numberOfPendingTasks() -> Int {
        return Int(self.json["numberOfPendingTasks"].doubleValue)
    }

    public func numberOfFulfilledTasks() -> Int {
        return Int(self.json["numberOfFulfilledTasks"].doubleValue)
    }
    
    public func totalAmountRaised() -> Double? {
        return self.json["totalAmountRaised"].double
    }
}
