//
//  AudioManager.swift
//  Balance
//
//  Created by Christopher Boynton on 1/15/17.
//  Copyright © 2017 Christopher. All rights reserved.
//

import AVFoundation

class AudioManager {
    
    private init() {}
    
    static var shared = AudioManager()
    
    var audioPlayer = AVAudioPlayer()
    
    func mainTheme() {
        
        let songURL: URL
        
        songURL = URL(fileURLWithPath: Bundle.main.path(forResource: "themeV001", ofType: "wav")!)
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("FAILURE: Error with setting up AVAudioSession")
        }
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: songURL)
            audioPlayer.prepareToPlay()
            audioPlayer.setVolume(0, fadeDuration: 0)
            audioPlayer.play()
            audioPlayer.setVolume(0, fadeDuration: 3)
        } catch {
            print("FAILURE: Error with setting up audio player")
        }
    }
    
}
