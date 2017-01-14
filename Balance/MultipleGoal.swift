//
//  MultipleGoal.swift
//  Balance
//
//  Created by Christopher Boynton on 1/14/17.
//  Copyright © 2017 Christopher. All rights reserved.
//

import Foundation

struct MultipleGoal: Goal {
    
    var name: String
    var description: String
    
    var payout: Int
    
    var goalNumber: Int
    var progressNumber: Int
    
    var dateSet: Date
    var dateCompleted: Date?
    
    init(name: String, description: String, payout: Int, goalNumber: Int, dateSet: Date, dateCompleted: Date? = nil) {
        self.name = name
        self.description = description
        self.payout = payout
        self.goalNumber = goalNumber
        self.progressNumber = 0
        self.dateSet = dateSet
        self.dateCompleted = dateCompleted
    }
    
}

extension MultipleGoal {
    
    var progress: Double {
        let goalDouble = Double(goalNumber)
        let progressDouble = Double(progressNumber)
        
        return progressDouble / goalDouble
    }
    
}
