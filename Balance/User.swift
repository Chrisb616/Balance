//
//  User.swift
//  Balance
//
//  Created by Christopher Boynton on 1/14/17.
//  Copyright © 2017 Christopher. All rights reserved.
//

import Foundation

class User {
    
    private init() {}
    static let shared = User()
    
    var name = ""
    var points = 0
    
    var activeRewards = [Date:Reward]()
    
    var strength = 0
    var stamina = 0
    var fortitude = 0
    var dexterity = 0
    var intelligence = 0
    var charisma = 0
    var wisdom = 0
}

extension User {
    
    //Save and Load
    func load() {
        
        if let storedUser = CoreDataManager.storedUser {
            
            guard let name = storedUser.name else { return }
            guard let pointsString = storedUser.points else { return }
            guard let points = Int(pointsString) else { return }
            
            
            self.name = name
            self.points = points
            
        }
        
    }
    
    func save() {
        CoreDataManager.saveUser(self)
    }
    
    func buy(reward: Reward) -> Bool {
        if points < reward.cost {
            return false
        } else {
            activeRewards[reward.dateCompleted!] = reward
            points -= reward.cost
            return true
        }
    }
    
}
