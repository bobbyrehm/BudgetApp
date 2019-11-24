//
//  Expense+CoreDataClass.swift
//  Budget
//
//  Created by Bobby Rehm on 11/24/19.
//  Copyright © 2019 Bobby Rehm. All rights reserved.
//

import Foundation
import CoreData

class Expense: NSManagedObject {
    
    @NSManaged var amount: NSNumber?
    @NSManaged var date: Date?
    @NSManaged var details: String?
    @NSManaged var name: String?
    @NSManaged var budgetPeriod: BudgetPeriod?
}
