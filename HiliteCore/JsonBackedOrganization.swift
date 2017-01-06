//
//  JsonBackedOrganization.swift
//  hilite
//
//  Created by Preston Pope on 11/9/16.
//  Copyright © 2016 Center Camp Media LLC. All rights reserved.
//

import Foundation
import SwiftyJSON

open class JsonBackedOrganization: Organization {
    
    let json: JSON!
    
    public init(json: JSON!) {
        self.json = json
    }
    
    // MARK: Organization
    
    public func name() -> String? {
        return json["name"].string
    }
}
