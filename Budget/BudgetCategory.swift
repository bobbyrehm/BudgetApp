//
//  BudgetCategory.swift
//  BudgetCategory
//
//  Created by Bobby Rehm on 10/3/19.
//  Copyright © 2019 Bobby Rehm. All rights reserved.
//

import Foundation

struct BudgetCategory: Identifiable {
    
    let id = UUID()
    let name: String
    let amount: Double
    let timeInterval: Int
}

#if DEBUG

let testBudgets = [
    BudgetCategory(name: "Groceries", amount: 100, timeInterval: 7),
    BudgetCategory(name: "Going Out", amount: 300, timeInterval: 31),
    BudgetCategory(name: "Clothes", amount: 50, timeInterval: 31),
    BudgetCategory(name: "Miscellaneous", amount: 100, timeInterval: 31)
]

#endif
