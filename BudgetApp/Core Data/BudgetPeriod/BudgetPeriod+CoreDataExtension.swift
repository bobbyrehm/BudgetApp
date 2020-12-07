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
    
    var totalExpenses: Double {
        expenses.compactMap { $0.amount.flatMap { Double(truncating: $0) } }.reduce(0, +)
    }
    
    var daysRemaining: Int {
        let currentDate = Date()
        return Int(currentDate.distance(to: endDate ?? Date()) / 24 / 60 / 60)
    }
    
    func addExpense(amount: Double, date: Date, name: String?, details: String?) {
        
        guard let managedObjectContext = managedObjectContext else {
            fatalError("Cannot add an expense without a managedObjectContext.")
        }
        
        let newExpense = Expense(context: managedObjectContext)
        newExpense.amount = NSNumber(value: amount)
        newExpense.budgetPeriod = self
        newExpense.name = name
        newExpense.details = details
        newExpense.date = date
    }
}
