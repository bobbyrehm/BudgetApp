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
        expenses.compactMap { $0.amount.flatMap { Float(truncating: $0) } }.reduce(0, +)
    }
    
    var daysRemaining: Int {
        let currentDate = Date()
        return Int(currentDate.distance(to: endDate ?? Date()) / 24 / 60 / 60)
    }
    
    static func allBudgetPeriodsFetchRequest() -> NSFetchRequest<BudgetPeriod> {
        guard let request: NSFetchRequest<BudgetPeriod> = BudgetPeriod.fetchRequest() as? NSFetchRequest<BudgetPeriod> else {
            fatalError("Unable to instantiate BudgetPeriod fetch request.")
        }
        request.sortDescriptors = [NSSortDescriptor(key: "startDate", ascending: true)]
        return request
    }
}
