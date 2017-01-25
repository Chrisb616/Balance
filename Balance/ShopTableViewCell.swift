//
//  ShopTableViewCell.swift
//  Balance
//
//  Created by Christopher Boynton on 1/18/17.
//  Copyright © 2017 Christopher. All rights reserved.
//

import UIKit

class ShopTableViewCell: UITableViewCell {
    
    var nameLabel = UILabel()
    var descriptionLabel = UILabel()
    var costLabel = UILabel()
    
    func setUpViews(for reward: Reward) {
        
        
        nameLabel.text = reward.name
        descriptionLabel.text = reward.description
        costLabel.text = String(describing: reward.cost)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("Laying out subview")
        
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(descriptionLabel)
        self.contentView.addSubview(costLabel)
        
        nameLabel.frame = CGRect(x: 0, y: 0, width: self.contentView.frame.width * 0.5, height: self.contentView.frame.height * 0.5)
        descriptionLabel.frame = CGRect(x: 0, y: self.contentView.frame.height * 0.5, width: self.contentView.frame.width * 0.5, height: self.contentView.frame.height * 0.5)
        costLabel.frame = CGRect(x: self.contentView.frame.width * 0.5, y: 0, width: self.contentView.frame.width * 0.5, height: self.contentView.frame.height * 0.5)
    }

}
