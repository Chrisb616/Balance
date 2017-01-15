//
//  PlayerCreationViewController.swift
//  Balance
//
//  Created by Christopher Boynton on 1/14/17.
//  Copyright © 2017 Christopher. All rights reserved.
//

import UIKit

class PlayerCreationViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setUpBackground()
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (timer) in
            self.heroIsBornEvent()
        }
    }
    
    func setUpBackground() {
        
        self.view.backgroundColor = Theme.colorForestGreen
        
    }
    
    func heroIsBornEvent() {
        var event = Event(uniqueID: "HeroIsBorn")
        
        event.add(description: "Awaken,$$$ my child.", visualKey: "HERO-START-01")
        event.add(description: "I have seen your destiny.", visualKey: "HER0-START-01")
        event.add(description: "Come with me,$$$$ and see what has been foretold$.$$$.$$$$$.", visualKey: "HER0-START-01")
        
        let eventViewController = EventViewController()
        
        let modalStyle: UIModalTransitionStyle = UIModalTransitionStyle.crossDissolve
        eventViewController.modalTransitionStyle = modalStyle
        eventViewController.event = event
        
        modalPresentationStyle = .popover
        present(eventViewController, animated: true)
        
    }

}
