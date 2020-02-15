//
//  BudgetPeriodCellViewModel.swift
//  BudgetApp
//
//  Created by Bobby Rehm on 2/15/20.
//  Copyright © 2020 Bobby Rehm. All rights reserved.
//

import Foundation

struct BudgetPeriodCellViewModel {
    
    let budgetPeriod: BudgetPeriod
    
    var budgetName: String {
        budgetPeriod.budget?.name ?? "Unknown"
    }
    
    private static var currencyFormatter: NumberFormatter = {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = .current
        return currencyFormatter
    }()
    
    var totalExpenses: String {
        
        guard let currencyString = Self.currencyFormatter.string(from: NSNumber(value: budgetPeriod.totalExpenses)) else {
            fatalError("Could not create currency string for \(budgetPeriod.totalExpenses)")
        }
        return currencyString
    }
    
    var daysRemaining: String {
        "\(budgetPeriod.daysRemaining) Days Remaining"
    }
}
