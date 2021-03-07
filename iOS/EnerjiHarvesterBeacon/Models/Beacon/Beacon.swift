//
//  Beacon.swift
//  EnerjiHarvesterBeacon
//
//  Created by Esra ÖZTÜRK on 25.01.2021.
//

import Foundation

public struct Beacon: Codable {
    var uid: String?
    var major: Int?
    var minor: Int?
    var rssi: Int?
    var distance: String?
    

    init() {
        
    }
    
    
    init(uid: String, major: Int, minor: Int, rssi: Int, distance:String) {
        self.uid = uid
        self.major = major
        self.minor = minor
        self.rssi = rssi
        self.distance = distance
    }
    
    public enum CodingKeys: String, CodingKey{
        case uid
        case major
        case minor
        case rssi
        case distance
    }
    
}


