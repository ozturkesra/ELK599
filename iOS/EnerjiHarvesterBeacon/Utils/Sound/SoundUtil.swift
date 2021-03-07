//
//  SoundHelper.swift
//  maksmart
//
//  Created by Esra ÖZTÜRK Group on 19.02.2019.
//  Copyright © 2019 Esra ÖZTÜRK. All rights reserved.
//

import Foundation
import AVFoundation

public class SoundUtil {
    
    var player: AVAudioPlayer?
    public static var shared = SoundUtil()
    
    init() { }
    
    func playSound(soundName: String, fileExtension: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: fileExtension) else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.ambient, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: fileExtension)
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            //print(error.localizedDescription)
        }
    }
    
}

