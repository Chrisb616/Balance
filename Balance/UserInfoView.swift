//
//  UserInfoView.swift
//  Balance
//
//  Created by Christopher on 1/25/17.
//  Copyright © 2017 Christopher. All rights reserved.
//

import UIKit

class UserInfoView: UIView {
    
    @IBOutlet weak var strengthNumberLabel: UILabel!
    @IBOutlet weak var staminaNumberLabel: UILabel!
    @IBOutlet weak var fortitudeNumberLabel: UILabel!
    @IBOutlet weak var dexterityNumberLabel: UILabel!
    @IBOutlet weak var intelligenceNumberLabel: UILabel!
    @IBOutlet weak var charismaNumberLabel: UILabel!
    @IBOutlet weak var wisdomNumberLabel: UILabel!

    
    func setUp(with user: User) {
        
        self.strengthNumberLabel.text = String(describing: user.strength)
        self.staminaNumberLabel.text = String(describing: user.stamina)
        self.fortitudeNumberLabel.text = String(describing: user.fortitude)
        self.dexterityNumberLabel.text = String(describing: user.dexterity)
        self.intelligenceNumberLabel.text = String(describing: user.intelligence)
        self.charismaNumberLabel.text = String(describing: user.charisma)
        self.wisdomNumberLabel.text = String(describing: user.wisdom)
        
    }
}
