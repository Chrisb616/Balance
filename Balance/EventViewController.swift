//
//  EventViewController.swift
//  Balance
//
//  Created by Christopher Boynton on 1/14/17.
//  Copyright © 2017 Christopher. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {
    
    var event: Event!
    var currentSlide: Int = 0
    
    var visualsWindow = UIView()
    var messageView = UIView()
    var messageTextView = UITextView()
    var advanceButton = UIButton()
    
    var typingTimer: Timer!
    var isTyping: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpBackground()
        setUpVisuals()
        setUpMessageBox()
        setUpButton()
        
        print("")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        typeOut(event.retrieve(at: 0)!.description)
    }
    
    func setUpBackground(){
        
        self.view.backgroundColor = UIColor.white
        
    }
    func setUpVisuals() {
        
        
        visualsWindow.backgroundColor = UIColor.black
        visualsWindow.layer.cornerRadius = 10
        visualsWindow.layer.borderWidth = 5
        visualsWindow.layer.borderColor = UIColor.darkGray.cgColor
        
        self.view.addSubview(visualsWindow)
        
        visualsWindow.frame = CGRect(x: 10, y: 20, width: self.view.frame.width - 20, height: self.view.frame.width - 20)
        
        
    }
    
    func setUpMessageBox() {
        
        messageView.backgroundColor = UIColor.white
        messageView.layer.cornerRadius = 10
        messageView.layer.borderWidth = 5
        messageView.layer.borderColor = UIColor.darkGray.cgColor
        
        self.view.addSubview(messageView)
        
        messageView.frame = CGRect(x: 10, y: self.view.frame.width + 10, width: self.view.frame.width - 20, height: self.view.frame.height * 0.85 - self.view.frame.width - 20)
        
        messageTextView.backgroundColor = UIColor.clear
        messageTextView.isEditable = false
        messageTextView.isSelectable = false
        messageTextView.font = UIFont(name: "AvenirNext-Regular", size: 30)
        
        self.messageView.addSubview(messageTextView)
        
        messageTextView.frame = CGRect(x: 3, y: 3, width: messageView.frame.width - 6, height: messageView.frame.height - 6)
        
    }
    func setUpButton() {
        
        advanceButton.backgroundColor = UIColor.black
        advanceButton.layer.cornerRadius = 10
        advanceButton.layer.borderWidth = 5
        advanceButton.layer.borderColor = UIColor.darkGray.cgColor
        
        self.view.addSubview(advanceButton)
        
        advanceButton.frame = CGRect(x: self.view.frame.width * 0.25, y: self.view.frame.height * 0.85, width: self.view.frame.width * 0.5, height: self.view.frame.height * 0.075)
        
        advanceButton.addTarget(self, action: #selector(advanceButtonTapped), for: .touchUpInside)
        
    }
    func advanceButtonTapped() {
        if isTyping {
            typingTimer.invalidate()
            messageTextView.text = event.retrieve(at: currentSlide)!.description
            isTyping = false
        } else {
            messageTextView.text = ""
            currentSlide += 1
            if currentSlide < event.count {
                guard let slide = event.retrieve(at: currentSlide) else { return }
                typeOut(slide.description)
                
            } else {
                dismiss(animated: true)
            }
        }
        
    }
    
    func typeOut(_ description: String) {
        
        isTyping = true
        
        let characterArray = description.characterArray
        var characterIndex = 0
        
        typingTimer = Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { (timer) in
            while characterArray[characterIndex] == " " {
                self.messageTextView.text.append(" ")
                characterIndex += 1
                if characterIndex == characterArray.count {
                    timer.invalidate()
                    self.isTyping = false
                    return
                }
            }
            self.messageTextView.text.append(characterArray[characterIndex])
            characterIndex += 1
            if characterIndex == characterArray.count {
                timer.invalidate()
                self.isTyping = false
                return
            }
        }
        
    }
    

}
