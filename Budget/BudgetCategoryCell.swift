//
//  BudgetCategoryCell.swift
//  Budget
//
//  Created by Bobby Rehm on 10/5/19.
//  Copyright © 2019 Bobby Rehm. All rights reserved.
//

import SwiftUI

struct BudgetCategoryCell: View {
    
    let budget: BudgetCategory
    
    var body: some View {
        HStack() {
            Text(budget.name).font(Font.system(.headline))
                .layoutPriority(2)
            Spacer()
                .layoutPriority(0)
            VStack(alignment: .trailing) {
                Text("\(budget.amount)")
                Text("\(budget.timeInterval) Days Remaining").lineLimit(1)
            }
                .layoutPriority(1)
        }
    }
}

struct BudgetCategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        BudgetCategoryCell(budget: testBudgets[0])
    }
}
