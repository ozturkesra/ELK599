//
//  DialogResult.swift
//  maksmart
//
//  Created by Esra ÖZTÜRK on 19.04.2019.
//  Copyright © 2019 Esra ÖZTÜRK. All rights reserved.
//

import Foundation

public enum DialogResult<Value> {
    case success(Value)
    case failure(Error)
}
