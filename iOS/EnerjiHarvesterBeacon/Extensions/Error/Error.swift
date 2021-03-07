//
//  Error.swift
//  Maksmart
//
//  Created by Uygar İŞİÇELİK on 16.06.2019.
//  Copyright © 2019 Uygar ISICELIK. All rights reserved.
//

import Foundation

public enum RESTError: Swift.Error {
    case unauthroized
    case serializationProblem
    case networkProblem
    case serverApplicationError
}
