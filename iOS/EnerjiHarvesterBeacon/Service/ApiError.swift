//
//  ApiError.swift
//  Maksmart
//
//  Created by Esra ÖZTÜRK on 12.10.2019.
//  Copyright © 2019 Esra ÖZTÜRK. All rights reserved.
//

import Foundation

public struct ApiError: Decodable {
    
    let code: Int?
    let message: ApiResponseError?
    let description: String?
    let subErrors: [SubError]?
    
    public enum CodingKeys: String, CodingKey {
        case code
        case message
        case description
        case subErrors
    }
}
