//
//  Record.swift
//  EnerjiHarvesterBeacon
//
//  Created by Esra ÖZTÜRK on 25.01.2021.
//

import Foundation

public struct Record: Decodable {
    
    public let id: String?
    public let createdDateTime: String?
    public let updatedDateTime: String?
    public let description: String?
    public let clientId: String?
    public let topic:String?
    public let message: String?
    public var mqttMessage: BeaconDecodable?
    
    public enum CodingKeys: String, CodingKey{
        case id
        case createdDateTime
        case updatedDateTime
        case description
        case clientId
        case topic
        case message
    }
}
