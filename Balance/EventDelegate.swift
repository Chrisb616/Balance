//
//  EventDelegate.swift
//  Balance
//
//  Created by Christopher Boynton on 1/15/17.
//  Copyright © 2017 Christopher. All rights reserved.
//

import UIKit

protocol EventDelegate: class {
    
    var eventWindow: EventWindow? { get set }
    
    func windowDismissed()
    
}


extension EventDelegate where Self: UIViewController {
    
    func layoutWindow() {
        
        guard let window = eventWindow else { return }
        
        self.view.addSubview(window)
        window.frame = CGRect(x: 10,
                                    y: 20,
                                    width: self.view.frame.width - 20,
                                    height: self.view.frame.height - 30)
        window.layoutSubviews()
        
    }
    
}
extension EventDelegate {
    
    func dismissWindow() {
        
        eventWindow?.isHidden = true
        eventWindow = nil
        
    }
    
    func fadeInWindow(withDuration duration: TimeInterval) {
        UIView.animate(withDuration: duration, animations: {
            self.eventWindow?.alpha = 1
        }) { (true) in
            self.eventWindow?.beginMessage()
        }
    }
    
    func fadeOutWindow(withDuration duration: TimeInterval) {
        UIView.animate(withDuration: duration, animations: {
            self.eventWindow?.alpha = 0
        }, completion: { (true) in
            self.dismissWindow()
        })
    }
    
}
