//
//  MenuViewController
//  Balance
//
//  Created by Christopher Boynton on 1/12/17.
//  Copyright © 2017 Christopher. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user = User.shared
        
        user.load()
        
        print(user.points)
        
        user.points += 1
        
        print(user.points)
        
        user.save()
        
    }


}

