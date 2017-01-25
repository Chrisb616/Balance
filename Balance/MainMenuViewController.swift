//
//  MainMenuViewController.swift
//  Balance
//
//  Created by Christopher on 1/25/17.
//  Copyright © 2017 Christopher. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var newGameButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpLayerAttributes()
    }

    
    func setUpLayerAttributes() {
        continueButton.layer.cornerRadius = 10
        continueButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        continueButton.layer.shadowOpacity = 1
        continueButton.layer.shadowRadius = 0
        
        newGameButton.layer.cornerRadius = 10
        newGameButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        newGameButton.layer.shadowOpacity = 1
        newGameButton.layer.shadowRadius = 0
    }

}
