//
//  RawTimePeriod+CoreDataExtension.swift
//  Budget
//
//  Created by Bobby Rehm on 11/14/19.
//  Copyright © 2019 Bobby Rehm. All rights reserved.
//

import Foundation
import CoreData

extension RawTimePeriod {
    
    var timePeriod: TimePeriod? {
        guard let timePeriodUnit = rawUnit.flatMap({ TimePeriodUnit(rawValue: $0) }) else { return nil }
        return TimePeriod(unit: timePeriodUnit, quantity: Int(quantity))
    }
    
    convenience init(unit: TimePeriodUnit, quantity: Int32, context: NSManagedObjectContext) {
        
        self.init(context: context)
        
        self.rawUnit = unit.rawValue
        self.quantity = quantity
    }
    
    convenience init(timePeriod: TimePeriod, context: NSManagedObjectContext) {
        
        self.init(unit: timePeriod.unit, quantity: Int32(timePeriod.quantity), context: context)
    }
}
