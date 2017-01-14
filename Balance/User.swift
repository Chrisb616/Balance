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
    
}
