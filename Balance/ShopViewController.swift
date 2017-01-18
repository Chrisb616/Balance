//
//  ShopViewController.swift
//  Balance
//
//  Created by Christopher Boynton on 1/18/17.
//  Copyright © 2017 Christopher. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var availableRewards = [Reward]()
    
    var shopListTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        availableRewards = dummyData
        
        setUpTableView()
        
    }
    
    func setUpTableView() {
        
        shopListTableView = UITableView()
        
        shopListTableView.register(ShopTableViewCell.self, forCellReuseIdentifier: "ShopItemCell")
        shopListTableView.delegate = self
        shopListTableView.dataSource = self
        
        self.view.addSubview(shopListTableView)
        
        shopListTableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        shopListTableView.backgroundColor = UIColor.yellow
        
        shopListTableView.reloadData()
    }
    
    var dummyData: [Reward] {
        var dummyData = [Reward]()
        
        dummyData.append(Reward(name: "One", description: "This thing", dateSet: Date(), dateCompleted: nil, cost: 100))
        dummyData.append(Reward(name: "Two", description: "That thing", dateSet: Date(), dateCompleted: nil, cost: 200))
        
        return dummyData
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return availableRewards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShopItemCell") as! ShopTableViewCell
        
        return cell
    }
    
}
