//
//  Optional+DescriptionOrNil.swift
//  BudgetApp
//
//  Created by Bobby Rehm on 6/19/20.
//  Copyright © 2020 Bobby Rehm. All rights reserved.
//

import Foundation

extension Optional {
    
    var descriptionOrNil: String {
        self.flatMap { "\($0)" } ?? "nil"
    }
}
