//
//  RegexUtil.swift
//  Maksmart
//
//  Created by Esra ÖZTÜRK on 26.07.2019.
//  Copyright © 2019 Esra ÖZTÜRK. All rights reserved.
//

import Foundation


public class RegexUtil {
    
    public static var shared = RegexUtil()
    
    init() { }
    
    func matches(for regex: String, in text: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text,
                                        range: NSRange(text.startIndex..., in: text))
            return results.map {
                String(text[Range($0.range, in: text)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
}
