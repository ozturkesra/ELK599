//
//  Query.swift
//  Maksmart
//
//  Created by Uygar İŞİÇELİK on 6.11.2019.
//  Copyright © 2019 Uygar İŞİÇELİK. All rights reserved.
//

import Foundation

public final class Queries {
    public static let LOGGED_IN_USER_QUERY : String = "query{loggedInUser{firstName lastName organization{id name type subordinates{id name}}}}"
    
    public static let LOCATIONS_QUERY : String = "query{locations(criteria:{organization:" + QueryUtil.queryStringInserter(to: "%@") + "}, sortBy:[{field:" + QueryUtil.queryStringInserter(to: "name") + ",direction:ASC}]){id name type address{city,county,latitude,longitude} devices {id serialNumber equipments installationDate flowSensorA{direction minValue maxValue} flowSensorB{direction minValue maxValue} ecSensorA{direction minValue maxValue} ecSensorB{direction minValue maxValue} waterTempSensorA{direction minValue maxValue} waterTempSensorB{direction minValue maxValue}}}}"
    
    public static let FLOW_SENSOR_DAILY_REPORT_QUERY = "query{sensorReports(criteria:{device:" + QueryUtil.queryStringInserter(to: "%@") + ",sensorType:%@ fromDate:" + QueryUtil.queryStringInserter(to: "%@") + ",toDate:" + QueryUtil.queryStringInserter(to: "%@") + " ,daily:true}){value date}}"
    
    public static let FLOW_SENSOR_HOUR_REPORT_QUERY = "query{sensorReports(criteria:{device:" + QueryUtil.queryStringInserter(to: "%@") + ",sensorType:%@ fromDate:" + QueryUtil.queryStringInserter(to: "%@") + ",toDate:" + QueryUtil.queryStringInserter(to: "%@") + " ,daily:false}){value time}}"
    
    public static let WATER_QUALITY_DAILY = "query{waterQualityReports(criteria:{device: " + QueryUtil.queryStringInserter(to: "%@") + ",sensorType:%@, fromDate:" + QueryUtil.queryStringInserter(to: "%@") + ",toDate:" + QueryUtil.queryStringInserter(to: "%@") +  ",daily:true}){ec temp date}}"
    
    public static let WATER_QUALITY_TIME = "query{waterQualityReports(criteria:{device: " + QueryUtil.queryStringInserter(to: "%@") + ",sensorType:%@, fromDate:" + QueryUtil.queryStringInserter(to: "%@") + ",toDate:" + QueryUtil.queryStringInserter(to: "%@") +  ",daily:false}){ec temp time}}"

    
    public static let YESTERDAY_WATER_QUALITY = "query{waterQualityReports(criteria:{device: " + QueryUtil.queryStringInserter(to: "%@") + ",sensorType:%@, fromDate:" + QueryUtil.queryStringInserter(to: "%@") + ",toDate:" + QueryUtil.queryStringInserter(to: "%@") +  ",daily:true}){ec temp}}"
    
    public static let ORGANIZATIONS = "query{organizations(sortBy:[{field:" + QueryUtil.queryStringInserter(to: "parent.name") + ",direction:ASC},{field:" + QueryUtil.queryStringInserter(to: "name") + ",direction:ASC}]){id parent{name}name}}"
    
    public static let NOTIFICATIONS = "query{loggedInUser{notifications{title body message timestamp{dateTime timezone utcOffset}}}}";
}
