//
//  BudgetPeriodCell.swift
//  Budget
//
//  Created by Bobby Rehm on 10/5/19.
//  Copyright © 2019 Bobby Rehm. All rights reserved.
//

import SwiftUI

struct BudgetPeriodCell: View {
    
    @ObservedObject var budgetPeriod: BudgetPeriod
    
    var budgetName: String {
        budgetPeriod.budget?.name ?? "Unknown"
    }
    
    var totalExpenses: String {
        
        guard let currencyString = Formatters.currency.string(from: NSNumber(value: budgetPeriod.totalExpenses)) else {
            fatalError("Could not create currency string for \(budgetPeriod.totalExpenses)")
        }
        return currencyString
    }
    
    var daysRemaining: String {
        "\(budgetPeriod.daysRemaining) Days Remaining"
    }
    
    var body: some View {
        HStack() {
            Text(budgetName)
                .font(.headline)
                .layoutPriority(2)
            Spacer()
                .layoutPriority(0)
            VStack(alignment: .trailing) {
                Text(totalExpenses)
                Text(daysRemaining)
                    .lineLimit(1)
            }
            .layoutPriority(1)
        }
    }
}

struct BudgetPeriodCell_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            BudgetPeriodCell(budgetPeriod: PreviewData().clothesBudget.currentBudgetPeriod!)
                .previewLayout(.fixed(width: 320, height: 60))
        }
    }
}
