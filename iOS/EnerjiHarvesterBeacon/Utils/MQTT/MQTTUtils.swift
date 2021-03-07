//
//  MQTTUtils.swift
//  EnerjiHarvesterBeacon
//
//  Created by Esra ÖZTÜRK on 24.01.2021.
//

import Foundation
import CocoaMQTT

public class MQTTUtils: CocoaMQTTDelegate {

    public static var shared = MQTTUtils()
    
    var mqttClient: CocoaMQTT?
    
    func connect() {
        let clientID = "Mobile"
        mqttClient = CocoaMQTT(clientID: clientID, host: "mqtt.esraozturk.me", port: 8883)
        mqttClient!.enableSSL  = true
        mqttClient!.username = "mqttuser"
        mqttClient!.password = "636492"
        mqttClient!.willMessage = CocoaMQTTWill(topic: "/will", message: "dieout")
        mqttClient!.keepAlive = 60
        mqttClient!.delegate = self
        mqttClient!.connect()
    }
    
    public func mqtt(_ mqtt: CocoaMQTT, didConnectAck ack: CocoaMQTTConnAck) {
        print("MQTT Connected Successfully")
    }
    
    public func mqtt(_ mqtt: CocoaMQTT, didPublishMessage message: CocoaMQTTMessage, id: UInt16) {
        print("MQTT Publish Successfully")
    }
    
    public func mqtt(_ mqtt: CocoaMQTT, didPublishAck id: UInt16) {
        print("MQTT Publish ACK Received Successfully")
    }
    
    public func mqtt(_ mqtt: CocoaMQTT, didReceiveMessage message: CocoaMQTTMessage, id: UInt16) {
        print("MQTT Received Message from topic: \(message.topic) payload: \(message.payload)")
    }
    
    public func mqtt(_ mqtt: CocoaMQTT, didSubscribeTopic topics: [String]) {
        print("MQTT Subscribe Topic Success \(topics)")
    }
    
    public func mqtt(_ mqtt: CocoaMQTT, didUnsubscribeTopic topic: String) {
        print("MQTT Unsubscribe Topic Success \(topic)")
    }
    
    public func mqttDidPing(_ mqtt: CocoaMQTT) {
        
    }
    
    public func mqttDidReceivePong(_ mqtt: CocoaMQTT) {
        
    }
    
    public func mqttDidDisconnect(_ mqtt: CocoaMQTT, withError err: Error?) {
        print("MQTT Connection Disconnected \(err)")
    }
    
    public func publishBeacon(payload: String) {
        mqttClient?.publish(CocoaMQTTMessage(topic: "/device/beacons", payload: Array(payload.utf8)))
    }
    
}
