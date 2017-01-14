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
        
         heroIsBornEvent()
    }
    
    func heroIsBornEvent() {
        var event = Event(uniqueID: "HeroIsBorn")
        
        event.add(description: "Awaken, my child.", visualKey: "HERO-START-01")
        event.add(description: "I have seen your destiny, mortal one. You will be a hero among your people. You will be brave, honest, and good. It is foretold...", visualKey: "HER0-START-02")
        
        let eventViewController = EventViewController()
        
        eventViewController.event = event
        
        present(eventViewController, animated: true)
        
    }

}
