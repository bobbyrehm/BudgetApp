//
//  User+CoreDataExtension.swift
//  Budget
//
//  Created by Bobby Rehm on 11/24/19.
//  Copyright © 2019 Bobby Rehm. All rights reserved.
//

import Foundation
import CoreData

extension User {
    
    var currentBudgetPeriods: [BudgetPeriod] {
        budgets.compactMap { $0.currentBudgetPeriod }.sorted(by: { lhs, rhs in
            lhs.startDate?.timeIntervalSinceReferenceDate ?? 0 > rhs.startDate?.timeIntervalSinceReferenceDate ?? 0 })
    }
}
