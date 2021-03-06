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
    
    @State var isPresentingAddBudget = false
        
    var body: some View {
        List {
            ForEach(user.currentBudgetPeriods) { budgetPeriod in
                NavigationLink(destination: ExpensesView(budgetPeriod: budgetPeriod)) {
                    BudgetPeriodCell(budgetPeriod: budgetPeriod)
                }
            }
        }
        .navigationBarTitle("Budgets")
        .navigationBarItems(trailing: Button(action: addButtonTapped) {
            Image(systemName: "plus")
                .font(.system(.title))
        })
        .sheet(isPresented: $isPresentingAddBudget) {
            AddBudgetContainerView()
                .environmentObject(user)
                .environment(\.managedObjectContext, managedObjectContext)
        }
    }
    
    func addButtonTapped() {
        isPresentingAddBudget = true
    }
}

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
