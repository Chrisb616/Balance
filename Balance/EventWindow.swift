//
//  EventWindow.swift
//  Balance
//
//  Created by Christopher Boynton on 1/14/17.
//  Copyright © 2017 Christopher. All rights reserved.
//

import UIKit

class EventWindow: UIView {
    
    var event: Event
    var currentSlide: Int = 0
    
    var visualsWindow = UIView()
    var messageView = UIView()
    var messageTextView = UITextView()
    var advanceButton = UIButton()
    
    var typingTimer: Timer!
    var isTyping: Bool = false
    
    weak var delegate: EventDelegate?
    
    init(event: Event) {
        self.event = event
        
        
        super.init(frame: CGRect.zero)
        
        self.alpha = 0
        setUpBackground()
        setUpVisuals()
        setUpMessageBox()
        setUpButton()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        visualsWindow.frame = CGRect(x: 10, y: 20, width: self.frame.width - 20, height: self.frame.width - 20)
        messageView.frame = CGRect(x: 10, y: self.frame.width + 10, width: self.frame.width - 20, height: self.frame.height * 0.85 - self.frame.width - 20)
        messageTextView.frame = CGRect(x: 3, y: 3, width: messageView.frame.width - 6, height: messageView.frame.height - 6)
        
        advanceButton.frame = CGRect(x: self.frame.width * 0.25, y: self.frame.height * 0.85, width: self.frame.width * 0.5, height: self.frame.height * 0.075)
    }
    
    func setUpBackground(){
        
        self.backgroundColor = UIColor.clear
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 5
        
    }
    func setUpVisuals() {
        
        
        visualsWindow.backgroundColor = UIColor.black
        visualsWindow.layer.cornerRadius = 10
        visualsWindow.layer.borderWidth = 5
        visualsWindow.layer.borderColor = UIColor.darkGray.cgColor
        
        self.addSubview(visualsWindow)
        
        
        
    }
    
    func setUpMessageBox() {
        
        messageView.backgroundColor = UIColor.white
        messageView.layer.cornerRadius = 10
        messageView.layer.borderWidth = 5
        messageView.layer.borderColor = UIColor.darkGray.cgColor
        
        self.addSubview(messageView)
        
        
        messageTextView.backgroundColor = UIColor.clear
        messageTextView.isEditable = false
        messageTextView.isSelectable = false
        messageTextView.font = Theme.fontMedium
        
        self.messageView.addSubview(messageTextView)
        
        
    }
    func setUpButton() {
        
        advanceButton.backgroundColor = UIColor.black
        advanceButton.layer.cornerRadius = 10
        advanceButton.layer.borderWidth = 5
        advanceButton.layer.borderColor = UIColor.darkGray.cgColor
        
        self.addSubview(advanceButton)
        
        
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
                print("Should fade...")
                delegate?.fadeOutWindow(withDuration: 5)
            }
        }
        
    }
    
    func beginMessage() {
        typeOut(event.retrieve(at: 0)!.description)
    }
    
    func typeOut(_ description: String) {
        
        isTyping = true
        
        let characterArray = description.characterArray
        var characterIndex = 0
        
        
        typingTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
            if characterArray[characterIndex] != "$" {
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
            }
            characterIndex += 1
            if characterIndex == characterArray.count {
                timer.invalidate()
                self.isTyping = false
                return
            }
        }
        
    }
    

}
