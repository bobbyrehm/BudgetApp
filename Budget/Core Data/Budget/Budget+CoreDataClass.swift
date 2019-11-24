//
//  Budget+CoreDataClass.swift
//  Budget
//
//  Created by Bobby Rehm on 11/24/19.
//  Copyright © 2019 Bobby Rehm. All rights reserved.
//

import Foundation
import CoreData

class Budget: NSManagedObject {
    
    @NSManaged var createdAt: Date?
    @NSManaged var name: String?
    @NSManaged var targetAmount: NSNumber?
    @NSManaged var budgetPeriods: Set<BudgetPeriod>
    @NSManaged var rawResetFrequency: RawTimePeriod?
    @NSManaged var user: User?
}
