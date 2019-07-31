//
//  Plant.swift
//  Planter
//
//  Created by Andrew Kyong on 7/30/19.
//  Copyright © 2019 PlanTer. All rights reserved.
//

import Foundation

class Plant {
    var hasBeenWatered: Bool = false
    var type: String = ""
    
    init(_ type: String) {
        self.type = type
    }
}
