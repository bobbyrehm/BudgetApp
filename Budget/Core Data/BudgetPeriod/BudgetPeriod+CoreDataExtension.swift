//
//  BudgetPeriod+CoreDataExtension.swift
//  Budget
//
//  Created by Bobby Rehm on 11/24/19.
//  Copyright © 2019 Bobby Rehm. All rights reserved.
//

import Foundation
import CoreData

extension BudgetPeriod {
    
    var totalExpenses: Float {
        return expenses.compactMap { $0.amount.flatMap { Float(truncating: $0) } }.reduce(0, +)
    }
}
