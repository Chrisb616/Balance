//
//  RootViewController
//  Balance
//
//  Created by Christopher Boynton on 1/12/17.
//  Copyright © 2017 Christopher. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        CoreDataManager.clearAllData()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if CoreDataManager.storedUser == nil {
            present(PlayerCreationViewController(), animated: true)
        }
    }


}

