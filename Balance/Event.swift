//
//  Event.swift
//  Balance
//
//  Created by Christopher Boynton on 1/14/17.
//  Copyright © 2017 Christopher. All rights reserved.
//

import Foundation

struct Event {
    
    var uniqueID: String
    
    var count: Int
    private var descriptions: [String]
    private var visualKeys: [String]
    
    init(uniqueID: String){
        self.uniqueID = uniqueID
        self.count = 0
        self.descriptions = [String]()
        self.visualKeys = [String]()
    }
    
    mutating func add(description: String, visualKey: String) {
        count += 1
        descriptions.append(description)
        visualKeys.append(visualKey)
    }
    
    func retrieve(at index: Int) -> (description: String, visualKey: String)? {
        if index < count {
            return (description: descriptions[index], visualKey: visualKeys[index])
        } else {
            return nil
        }
    }
    
}
