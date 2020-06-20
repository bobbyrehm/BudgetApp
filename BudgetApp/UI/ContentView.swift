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
    
    var body: some View {
        NavigationView {
            CurrentBudgetPeriodsView()
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            ContentView()
                .environment(\.managedObjectContext, previewData.managedObjectContext)
        }
    }
}
#endif
