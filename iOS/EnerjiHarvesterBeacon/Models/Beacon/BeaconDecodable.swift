//
//  BeaconDecodable.swift
//  EnerjiHarvesterBeacon
//
//  Created by Esra ÖZTÜRK on 25.01.2021.
//

import Foundation

public struct BeaconDecodable: Decodable {
    var uid: String?
    var major: Int?
    var minor: Int?
    var rssi: Int?
    var distance: String?
    
    public enum CodingKeys: String, CodingKey{
        case uid
        case major
        case minor
        case rssi
        case distance
    }
    
}
