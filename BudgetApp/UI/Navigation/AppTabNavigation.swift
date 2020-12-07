//
//  AppTabNavigation.swift
//  BudgetApp
//
//  Created by Bobby Rehm on 12/6/20.
//  Copyright © 2020 Bobby Rehm. All rights reserved.
//

import SwiftUI

// MARK: - AppTabNavigation

struct AppTabNavigation: View {
    
    @State private var selection: Tab = .budgets

    var body: some View {
        TabView(selection: $selection) {
            NavigationView {
                CurrentBudgetPeriodsView()
            }
            .tabItem {
                Label("Budgets", systemImage: "creditcard")
                    .accessibility(label: Text("Budgets"))
            }
            .tag(Tab.budgets)
            
            NavigationView {
                Text("")
                    .navigationTitle("Trends")
            }
            .tabItem {
                Label("Trends", systemImage: "chart.bar")
                    .accessibility(label: Text("Trends"))
            }
            .tag(Tab.trends)
            
            NavigationView {
                Text("")
                    .navigationTitle("Settings")
            }
            .tabItem {
                Label("Settings", systemImage: "gearshape")
                    .accessibility(label: Text("Settings"))
            }
            .tag(Tab.trends)
        }
    }
}

// MARK: - Tab

extension AppTabNavigation {
    enum Tab {
        case budgets
        case trends
        case settings
    }
}

// MARK: - Previews

struct AppTabNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppTabNavigation()
            .environment(\.managedObjectContext, previewData.managedObjectContext)
            .environmentObject(PreviewData().user)
    }
}
