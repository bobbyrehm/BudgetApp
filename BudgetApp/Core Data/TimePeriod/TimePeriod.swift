//
//  TimePeriod.swift
//  Budget
//
//  Created by Bobby Rehm on 11/14/19.
//  Copyright © 2019 Bobby Rehm. All rights reserved.
//

import Foundation

enum TimePeriodUnit: String, CaseIterable {
    
    case day = "day"
    case week = "week"
    case month = "month"
    case year = "year"
    
    var timeInterval: TimeInterval {
        let dayTimeInterval: TimeInterval = 60 * 60 * 24
        
        switch self {
        case .day:
            return dayTimeInterval
        case .week:
            return dayTimeInterval * 7
        case .month:
            return dayTimeInterval * 30
        case .year:
            return dayTimeInterval * 365
        }
    }
    
    init(unit: String) {
        guard let timePeriodUnit = TimePeriodUnit(rawValue: unit) else { fatalError("Invalid unit string.") }
        self = timePeriodUnit
    }
}

struct TimePeriod {
    
    let unit: TimePeriodUnit
    let quantity: Int
    
    var displayString: String {
        "\(quantity) \(unit.rawValue)" + (quantity > 1 ? "s" : "")
    }
    
    var timeInterval: TimeInterval {
        unit.timeInterval * Double(quantity)
    }
}
