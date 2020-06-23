//
//  ExpenseCell.swift
//  BudgetApp
//
//  Created by Bobby Rehm on 6/19/20.
//  Copyright © 2020 Bobby Rehm. All rights reserved.
//

import SwiftUI

struct ExpenseCell: View {
    
    @ObservedObject var expense: Expense
    
    var expenseName: String {
        expense.name ?? "Unnamed"
    }
        
    var expenseAmount: String {
        
        guard let expenseAmount = expense.amount else { return "" }
        
        guard let currencyString = Formatters.currency.string(from: expenseAmount) else {
            fatalError("Could not create currency string for \(expenseAmount)")
        }
        
        return currencyString
    }
    
    var date: String {
        
        guard let date = expense.date else { return "Unknown Date" }
        
        return Formatters.shortDate.string(from: date)
    }
    
    var body: some View {
        HStack() {
            VStack(alignment: .leading) {
                Text(expenseName)
                    .font(.headline)
                Spacer()
                expense.details.flatMap {
                    Text($0)
                        .font(.caption)
                }
            }
            .layoutPriority(1)
            
            Spacer()
                .layoutPriority(0)
            VStack(alignment: .trailing) {
                Text(expenseAmount)
                    .font(.headline)
                Spacer()
                Text(date)
                    .font(.callout)
                    .lineLimit(1)
            }
            .layoutPriority(1)
        }
        .padding()
        .frame(height: 50)
    }
}

#if DEBUG
struct ExpenseCell_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseCell(expense: previewData.clothesBudget.currentBudgetPeriod!.expenses.first!)
            .previewLayout(.fixed(width: 320, height: 50))
    }
}
#endif
