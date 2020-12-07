//
//  BudgetApp.swift
//  Budget
//
//  Created by Bobby Rehm on 7/27/19.
//  Copyright © 2019 Bobby Rehm. All rights reserved.
//

import SwiftUI

@main
struct BudgetApp: App {
    
    let coreDataManager: CoreDataManager = {
        let coreDataManager = CoreDataManager(modelName: "BudgetApp")
        _ = coreDataManager.managedObjectContext
        return coreDataManager
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, coreDataManager.managedObjectContext)
                .environmentObject(coreDataManager)
                .environmentObject(coreDataManager.currentUser)
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                    try? coreDataManager.managedObjectContext.save()
                }
        }
    }
}
