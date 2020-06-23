//
//  ExpensesView.swift
//  BudgetApp
//
//  Created by Bobby Rehm on 6/19/20.
//  Copyright © 2020 Bobby Rehm. All rights reserved.
//

import SwiftUI
import CoreData

struct ExpensesView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext: NSManagedObjectContext
    
    @ObservedObject var budgetPeriod: BudgetPeriod
    
    var body: some View {
        List {
            ForEach(Array(budgetPeriod.expenses)) { expense in
                ExpenseCell(expense: expense)
            }
        }
        .navigationBarTitle(budgetPeriod.budget?.name ?? "Unnamed Budget")
        .navigationBarItems(trailing: Button(action: addButtonTapped) {
            Image(systemName: "plus")
                .font(.system(.title))
        })
    }
    
    func addButtonTapped() {
        budgetPeriod.addExpense()
    }
}

#if DEBUG
struct ExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ExpensesView(budgetPeriod: previewData.groceriesBudget.currentBudgetPeriod!)
        }
    }
}
#endif
