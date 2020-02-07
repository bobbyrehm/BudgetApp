//
//  User+CoreDataClass.swift
//  Budget
//
//  Created by Bobby Rehm on 11/24/19.
//  Copyright © 2019 Bobby Rehm. All rights reserved.
//

import Foundation
import CoreData

class User: NSManagedObject {
    
    @NSManaged var email: String?
    @NSManaged var firstName: String?
    @NSManaged var lastName: String?
    @NSManaged var password: String?
    @NSManaged var username: String?
    @NSManaged var budgets: Set<Budget>
}
