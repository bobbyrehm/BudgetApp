//
//  ContentView.swift
//  Budget
//
//  Created by Bobby Rehm on 7/27/19.
//  Copyright © 2019 Bobby Rehm. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    var budgets: [BudgetCategory]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(budgets) { budget in
                    BudgetCategoryCell(budget: budget)
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
struct ContentView_Previews : PreviewProvider {
    
    static var previews: some View {
        ContentView(budgets: testBudgets)
    }
}
#endif
