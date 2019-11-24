//
//  TimePeriod.swift
//  Budget
//
//  Created by Bobby Rehm on 11/14/19.
//  Copyright © 2019 Bobby Rehm. All rights reserved.
//

import Foundation

enum TimePeriodUnit: String {
    
    case day = "day"
    case week = "week"
    case month = "month"
    case year = "year"
    
    init(unit: String) {
        guard let timePeriodUnit = TimePeriodUnit(rawValue: unit) else { fatalError("Invalid unit string.") }
        self = timePeriodUnit
    }
}

struct TimePeriod {
    
    let unit: TimePeriodUnit
    let quantity: Int
    
    var displayString: String {
        return "\(quantity) \(unit.rawValue)" + (quantity > 1 ? "s" : "")
    }
}
