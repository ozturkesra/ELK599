//
//  UserDefaultUtil.swift
//  Maksmart
//
//  Created by Esra ÖZTÜRK on 16.06.2019.
//  Copyright © 2019 Esra ÖZTÜRK. All rights reserved.
//

import Foundation

public class UserDefaultUtil {
    
    public static var shared = UserDefaultUtil()
    
    let userDefault = UserDefaults.standard
    
    func save(key: String, value: Any?) {
        userDefault.set(value, forKey: key)
    }
    
    func getString(key: String) -> String? {
        if let value = userDefault.string(forKey: key) {
            return value
        } else {
            return nil
        }
    }
    
    func getBool(key: String) -> Bool {
        return userDefault.bool(forKey: key)
    }
    
}
