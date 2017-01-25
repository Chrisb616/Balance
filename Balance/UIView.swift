//
//  UIView.swift
//  Balance
//
//  Created by Christopher on 1/25/17.
//  Copyright © 2017 Christopher. All rights reserved.
//

import UIKit

extension UIView {
    
    func addFittedSubview(_ view: UIView, multiplier: CGFloat = 1) {
        self.addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        view.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: multiplier).isActive = true
        view.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: multiplier).isActive = true
    }
    
}
