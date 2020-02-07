//
//  ContentView.swift
//  Budget
//
//  Created by Bobby Rehm on 7/27/19.
//  Copyright © 2019 Bobby Rehm. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(fetchRequest: BudgetPeriod.allBudgetPeriodsFetchRequest()) var budgetPeriods: FetchedResults<BudgetPeriod>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(budgetPeriods) { budgetPeriod in
                    BudgetCategoryCell(budgetPeriod: budgetPeriod)
                }
            }
            .navigationBarTitle("Budgets")
            .navigationBarItems(trailing: Button(action: {
                print("Tapped me!")
            }, label: {
                Image(systemName: "plus").font(Font.system(.title))
            }))
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            ContentView()
                .environment(\.managedObjectContext, PreviewData().managedObjectContext)
        }
    }
}
#endif
