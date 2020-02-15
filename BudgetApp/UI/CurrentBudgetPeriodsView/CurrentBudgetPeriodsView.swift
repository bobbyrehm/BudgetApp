//
//  CurrentBudgetPeriodsView.swift
//  BudgetApp
//
//  Created by Bobby Rehm on 2/15/20.
//  Copyright © 2020 Bobby Rehm. All rights reserved.
//

import SwiftUI

struct CurrentBudgetPeriodsView: View {
    
    let viewModel: CurrentBudgetPeriodsViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.budgetPeriods) { budgetPeriod in
                BudgetPeriodCell(viewModel: BudgetPeriodCellViewModel(budgetPeriod: budgetPeriod))
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

#if DEBUG
struct CurrentBudgetPeriodsView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            NavigationView {
                CurrentBudgetPeriodsView(viewModel: CurrentBudgetPeriodsViewModel(budgetPeriods: []))
            }
        }
    }
}
#endif
