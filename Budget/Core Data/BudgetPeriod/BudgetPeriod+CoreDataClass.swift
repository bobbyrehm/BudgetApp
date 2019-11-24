//
//  BudgetPeriod+CoreDataClass.swift
//  Budget
//
//  Created by Bobby Rehm on 11/24/19.
//  Copyright © 2019 Bobby Rehm. All rights reserved.
//

import Foundation
import CoreData

class BudgetPeriod: NSManagedObject {
    
    @NSManaged var startDate: Date?
    @NSManaged var endDate: Date?
    @NSManaged var targetAmount: NSNumber?
    @NSManaged var budget: Budget?
    @NSManaged var expenses: Set<Expense>
}
