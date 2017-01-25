//
//  UserLandingViewController.swift
//  Balance
//
//  Created by Christopher on 1/25/17.
//  Copyright © 2017 Christopher. All rights reserved.
//

import UIKit

class UserLandingViewController: UIViewController {
    
    @IBOutlet weak var userInfoContainer: UIView!
    
    var userInfoView = UserInfoView()
    
    override func viewDidLoad() {
        layoutUserInfoView()
    }
    
    func layoutUserInfoView() {
        userInfoContainer.addFittedSubview(userInfoView)
    }
    
}
