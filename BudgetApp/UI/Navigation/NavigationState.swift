//
//  NavigationState.swift
//  BudgetApp
//
//  Created by Bobby Rehm on 6/28/20.
//  Copyright © 2020 Bobby Rehm. All rights reserved.
//

import Foundation
import Combine

enum Screen {
    
    case currentBudgetPeriods
    case expenses(budgetPeriod: BudgetPeriod)
}

class NavigationState: ObservableObject {
    
    @Published var currentScreen: Screen = .currentBudgetPeriods
    
    func selectedBudgetPeriod(_ budgetPeriod: BudgetPeriod) {
        currentScreen = .expenses(budgetPeriod: budgetPeriod)
    }
}
