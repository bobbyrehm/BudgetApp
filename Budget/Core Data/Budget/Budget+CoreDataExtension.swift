//
//  Budget+CoreDataExtension.swift
//  Budget
//
//  Created by Bobby Rehm on 11/24/19.
//  Copyright © 2019 Bobby Rehm. All rights reserved.
//

import Foundation
import CoreData

extension Budget {
    
    var resetFrequency: TimePeriod {
        return rawResetFrequency?.timePeriod ?? TimePeriod(unit: .month, quantity: 1)
    }
}
