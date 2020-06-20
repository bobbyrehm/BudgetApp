//
//  CurrentBudgetPeriodsView.swift
//  BudgetApp
//
//  Created by Bobby Rehm on 2/15/20.
//  Copyright © 2020 Bobby Rehm. All rights reserved.
//

import SwiftUI
import CoreData

struct CurrentBudgetPeriodsView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext: NSManagedObjectContext
    @EnvironmentObject var user: User
        
    var body: some View {
        List {
            ForEach(user.currentBudgetPeriods) { budgetPeriod in
                BudgetPeriodCell(viewModel: BudgetPeriodCellViewModel(budgetPeriod: budgetPeriod))
            }
        }
        .navigationBarTitle("Budgets")
        .navigationBarItems(trailing: Button(action: addButtonTapped) {
            Image(systemName: "plus")
                .font(.system(.title))
        })
    }
    
    func addButtonTapped() {
        
        let newBudget = Budget(name: "Test Budget", resetFrequency: TimePeriod(unit: .month, quantity: 1), managedObjectContext: managedObjectContext)
        newBudget.addBudgetPeriod()
        newBudget.user = user
    }
}

#if DEBUG
struct CurrentBudgetPeriodsView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            NavigationView {
                CurrentBudgetPeriodsView()
                    .environmentObject(previewData.user)
            }
        }
    }
}
#endif
