//
//  RawTimePeriod+CoreDataClass.swift
//  Budget
//
//  Created by Bobby Rehm on 11/24/19.
//  Copyright © 2019 Bobby Rehm. All rights reserved.
//

import Foundation
import CoreData

class RawTimePeriod: NSManagedObject {
    
    @NSManaged var quantity: Int32
    @NSManaged var rawUnit: String?
}
