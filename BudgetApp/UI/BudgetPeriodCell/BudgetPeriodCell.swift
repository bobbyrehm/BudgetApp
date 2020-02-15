//
//  BudgetPeriodCell.swift
//  Budget
//
//  Created by Bobby Rehm on 10/5/19.
//  Copyright © 2019 Bobby Rehm. All rights reserved.
//

import SwiftUI

struct BudgetPeriodCell: View {
    
    let viewModel: BudgetPeriodCellViewModel
    
    var body: some View {
        HStack() {
            Text(viewModel.budgetName)
                .font(.headline)
                .layoutPriority(2)
            Spacer()
                .layoutPriority(0)
            VStack(alignment: .trailing) {
                Text(viewModel.totalExpenses)
                Text(viewModel.daysRemaining)
                    .lineLimit(1)
            }
            .layoutPriority(1)
        }
    }
}

#if DEBUG
struct BudgetPeriodCell_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            BudgetPeriodCell(viewModel: BudgetPeriodCellViewModel(budgetPeriod: PreviewData().clothesBudget.currentBudgetPeriod!))
                .previewLayout(.fixed(width: 320, height: 60))
        }
    }
}
#endif
