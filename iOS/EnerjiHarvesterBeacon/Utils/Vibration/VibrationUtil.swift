//
//  VibrationHelper.swift
//  maksmart
//
//  Created by Esra ÖZTÜRK on 14.03.2019.
//  Copyright © 2019 Esra ÖZTÜRK. All rights reserved.
//

import Foundation
import AVFoundation

public class VibrationUtil {
    
    static func vibrate() {
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
    
    static func shortVibrate() {
        AudioServicesPlayAlertSound(1521)
    }
}
