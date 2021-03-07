//
//  DateTimeUtil.swift
//  Timeware Admin
//
//  Created by Esra ÖZTÜRK on 18.06.2019.
//  Copyright © 2019 Esra ÖZTÜRK. All rights reserved.
//

import Foundation
import UIKit

public class DateTimeUtil {
    
    public static let shared = DateTimeUtil()
    
    //public static let ISO_DATE_FORMAT = "yyyy-MM-dd'T'HH:mm:ss.SSS"
    public static let ISO_DATE_FORMAT = "yyyy-MM-dd'T'HH:mm:ss'Z'"
    public static let ISO_DATE_FORMAT_WITHOUT_SECOND = "yyyy-MM-dd'T'HH:mm"
    public static let DATE_FORMAT = "dd-MM-yyyy"
    public static let DATE_FORMAT_WITHOUT_YEAR = "dd.MM"
    public static let DATE_TIME_FORMAT = "dd-MM-yyyy HH:mm:ss"
    public static let SERVER_DATE_FORMAT = "YYYY-MM-dd"
    public static let TIME = "HH:mm"
    public static let TIME_SEPERATOR = ":"
    
    func convertDateToStringWithoutInterval(date:NSDate, dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: date as Date)
    }
    
    
    func convertDateToString(date:NSDate, dateFormat: String) -> String {
        let newDate = date.addingTimeInterval( TimeInterval(-3.0 * 60.0 * 60.0))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: newDate as Date)
    }
    
    func startOfMonth() -> Date {
        var startDayOfMonth = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: Date())))!
        return Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of:startDayOfMonth)!
    }
    
    func endOfMonth() -> Date {
        var endDayOfMonth = Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
        return Calendar.current.date(bySettingHour: 23, minute: 59, second: 59, of:endDayOfMonth)!
    }
    
    func lastWeek() -> Date {
        return Calendar.current.date(byAdding: DateComponents(day: -7), to: Date())!
    }
    
    func yesterday() -> Date {
        return Calendar.current.date(byAdding: DateComponents(day: -1), to: Date())!
    }
    
    func getCurrentYear() -> String {
        return "\(Calendar.current.component(.year, from: Date()))"
    }
    
    func startOfMonth(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: startOfMonth())
    }
    
    func endOfMonth(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: endOfMonth())
    }
    
    func changeFormat(baseFormat: String, resultFormat: String, date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = baseFormat
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        let dateItem = dateFormatter.date(from: date)
        dateFormatter.dateFormat = resultFormat
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        return dateFormatter.string(from: dateItem!)
        
    }
    
    func convertMinuteToHour (minutes : Int) -> (hours : Int , leftMinutes : Int) {
        return (minutes / 60, (minutes % 60))
    }
    
    func convertStringToDate(date: String, format: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: date)!
    }
    
}
