//
//  Utilities.swift
//  CelestialSystem
//
//  Created by Leo Liu on 1/21/25.
//

import Foundation

extension Int {
    func quotient(rhs: Int) -> Int {
        if self < 0 {
            return (self - (rhs - 1)) / rhs
        } else {
            return self / rhs
        }
    }
}

extension Calendar {
    static let beijingTime = TimeZone(identifier: "Asia/Shanghai")!
    
    static let utcCalendar: Self = {
        var cal = Calendar(identifier: .iso8601)
        cal.timeZone = TimeZone(abbreviation: "UTC")!
        return cal
    }()
}

extension Date {
    static func from(year: Int, month: Int, day: Int, hour: Int, minute: Int, timezone: TimeZone?) -> Date? {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.hour = hour
        dateComponents.minute = minute
        if let timezone {
            dateComponents.timeZone = timezone
        }
        return Calendar(identifier: .iso8601).date(from: dateComponents)
    }
}

infix operator %%: MultiplicationPrecedence

extension BinaryInteger {
    static func %%(_ left: Self, _ right: Self) -> Self {
        let mod = left % right
        return mod >= 0 ? mod : mod + right
    }
}

extension FloatingPoint {
    static func %%(_ left: Self, _ right: Self) -> Self {
        let mod = left.truncatingRemainder(dividingBy: right)
        return mod >= 0 ? mod : mod + right
    }
}
