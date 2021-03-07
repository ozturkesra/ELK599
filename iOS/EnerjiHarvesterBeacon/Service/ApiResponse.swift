//
//  ApiResponse.swift
//  Maksmart
//
//  Created by Esra ÖZTÜRK on 12.10.2019.
//  Copyright © 2019 Esra ÖZTÜRK. All rights reserved.
//

import Foundation

public struct ApiResponse<T:Decodable> : Decodable {
    
    var data: T?
    let error: ApiError?
    let timestamp: String?
    
    
    public enum CodingKeys: String, CodingKey {
        case data
        case error
        case timestamp
    }
}
