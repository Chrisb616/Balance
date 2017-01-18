//
//  SingleGoal.swift
//  Balance
//
//  Created by Christopher Boynton on 1/14/17.
//  Copyright © 2017 Christopher. All rights reserved.
//

import Foundation

struct SingleGoal: Goal {
    
    var name: String
    var description: String
    
    var payout: Int
    
    var dateSet: Date
    var dateCompleted: Date?
    
    
    init(name: String, description: String, payout: Int, dateSet: Date, dateCompleted: Date? = nil) {
        self.name = name
        self.description = description
        self.payout = payout
        self.dateSet = dateSet
        self.dateCompleted = nil
    }
    
}
