//
//  PreviewData.swift
//  Budget
//
//  Created by Bobby Rehm on 11/27/19.
//  Copyright © 2019 Bobby Rehm. All rights reserved.
//

import Foundation
import CoreData

#if DEBUG

let previewData = PreviewData()

struct PreviewData {
    
    let coreDataManager = CoreDataManager(modelName: "BudgetApp")

    var managedObjectContext: NSManagedObjectContext {
        return coreDataManager.managedObjectContext
    }

    let user: User
    let groceriesBudget: Budget
    let goingOutBudget: Budget
    let clothesBudget: Budget
    let miscBudget: Budget

    init() {
        
        let managedObjectContext = coreDataManager.managedObjectContext
        
        user = User(context: managedObjectContext)
        user.firstName = "Bobby"
        user.lastName = "Rehm"
        user.username = "brehm"
        user.password = "password"
        user.email = "bobbyrehm502@gmail.com"
        
        groceriesBudget = Budget(name: "Groceries", resetFrequency: TimePeriod(unit: .month, quantity: 1), managedObjectContext: managedObjectContext)
        goingOutBudget = Budget(name: "Going Out", resetFrequency: TimePeriod(unit: .month, quantity: 1), managedObjectContext: managedObjectContext)
        clothesBudget = Budget(name: "Clothes", resetFrequency: TimePeriod(unit: .month, quantity: 1), managedObjectContext: managedObjectContext)
        miscBudget = Budget(name: "Misc", resetFrequency: TimePeriod(unit: .month, quantity: 1), managedObjectContext: managedObjectContext)
        
        for budget in [groceriesBudget, goingOutBudget, clothesBudget, miscBudget] {
            budget.addBudgetPeriod()
            budget.user = user
        }
        
        for budgetPeriod in user.currentBudgetPeriods {
            budgetPeriod.addExpense()
        }
        
        try? coreDataManager.managedObjectContext.save()
    }
}

#endif
