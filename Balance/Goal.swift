//
//  Goal.swift
//  Balance
//
//  Created by Christopher Boynton on 1/14/17.
//  Copyright © 2017 Christopher. All rights reserved.
//

import Foundation

protocol Goal {
    
    var name: String { get set }
    var description: String { get set }
    var dateSet: Date { get set }
    var dateCompleted: Date? { get set }
    
    var payout: Int { get set }
    
}

extension Goal {
    
    var isComplete: Bool { return dateCompleted != nil }
    
    var duration: TimeInterval? {
        if let completed = dateCompleted {
            return completed.timeIntervalSince(dateSet)
        } else {
            return nil
        }
    }
    
}
