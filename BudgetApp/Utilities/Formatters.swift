//
//  Formatters.swift
//  BudgetApp
//
//  Created by Bobby Rehm on 6/19/20.
//  Copyright © 2020 Bobby Rehm. All rights reserved.
//

import Foundation

struct Formatters {
    
    static var currency: NumberFormatter = {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.isLenient = true
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = .autoupdatingCurrent
        return currencyFormatter
    }()
    
    static var shortDate: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        dateFormatter.locale = .autoupdatingCurrent
        return dateFormatter
    }()
}
