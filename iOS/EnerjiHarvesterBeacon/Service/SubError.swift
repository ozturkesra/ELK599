//
//  SubError.swift
//  Maksmart
//
//  Created by Esra ÖZTÜRK on 12.10.2019.
//  Copyright © 2019 Esra ÖZTÜRK. All rights reserved.
//

import Foundation

public struct SubError: Decodable {
    
    let name: String
    let description: String
    
    public enum CodingKeys: String, CodingKey {
        case name
        case description
    }
}
