//
//  ClockFace.swift
//  Clock
//
//  Created by Yujin Ariza on 4/21/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import Foundation

public class ClockFace {
    
    var date: NSDate = NSDate()
    let calendar: NSCalendar = NSCalendar.currentCalendar()
    
    
    public func updateDate() {
        date = NSDate()
    }
    
    public func getHourHandDegrees() -> Double {
        let hour: Int = calendar.component(.Hour, fromDate: date) % 12
        let minute: Int = calendar.component(.Minute, fromDate: date)
        let second: Int = calendar.component(.Second, fromDate: date)
        let hourMove = Double(hour) * (360 / 12)
        let minuteMove = Double(minute) * (360 / 12 / 60)
        let secondMove = Double(second) * (360 / 12 / 60)
        return hourMove + minuteMove + secondMove
    }
    
    public func getMinuteHandDegrees() -> Double {
        let minute: Int = calendar.component(.Minute, fromDate: date)
        let second: Int = calendar.component(.Second, fromDate: date)
        return Double(minute) * (360/60) +
                Double(second) * (360 / 60 / 60)
    }
    
    public func getSecondHandDegrees() -> Double {
        let second: Int = calendar.component(.Second, fromDate: date)
        return Double(second) * (360/60)
    }
}
