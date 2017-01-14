//
//  String.swift
//  Balance
//
//  Created by Christopher Boynton on 1/14/17.
//  Copyright © 2017 Christopher. All rights reserved.
//

import Foundation

extension String {
    
    var characterArray: [Character] {
        var characterArray = [Character]()
        
        for character in self.characters {
            characterArray.append(character)
        }
        
        return characterArray
    }
    
}
