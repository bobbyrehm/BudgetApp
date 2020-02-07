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
    
    // MARK: - Convenience Init
    
    convenience init(name: String, resetFrequency: TimePeriod, managedObjectContext: NSManagedObjectContext) {
        
        self.init(context: managedObjectContext)
        
        self.name = name
        self.resetFrequency = resetFrequency
        self.createdAt = Date()
    }
    
    // MARK: - Computed Vars
    
    var currentBudgetPeriod: BudgetPeriod? {
        budgetPeriods.first { budgetPeriod in
            guard let startDate = budgetPeriod.startDate, let endDate = budgetPeriod.endDate else { return false }
            return startDate < Date() && endDate > Date()
        }
    }
    
    var resetFrequency: TimePeriod {
        get {
            rawResetFrequency?.timePeriod ?? TimePeriod(unit: .month, quantity: 1)
        }
        set {
            guard let managedObjectContext = managedObjectContext else { fatalError("Cannot set resetFrequency for a Budget whose managedObjectContext is nil.") }
            rawResetFrequency = RawTimePeriod(timePeriod: newValue, context: managedObjectContext)
        }
    }
    
    // MARK: - Public Interface
    
    func addBudgetPeriod() {
        
        guard let managedObjectContext = managedObjectContext else { fatalError("Cannot add BudgetPeriod for a Budget whose managedObjectContext is nil.") }
        let budgetPeriod = BudgetPeriod(context: managedObjectContext)
        budgetPeriod.budget = self
        budgetPeriod.startDate = Date()
        budgetPeriod.endDate = Date().addingTimeInterval(resetFrequency.timeInterval)
    }
}
