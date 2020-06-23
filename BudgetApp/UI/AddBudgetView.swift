//
//  AddBudgetView.swift
//  BudgetApp
//
//  Created by Bobby Rehm on 6/21/20.
//  Copyright © 2020 Bobby Rehm. All rights reserved.
//

import SwiftUI
import CoreData

struct AddBudgetView: View {
    
    @EnvironmentObject var user: User
    @Environment(\.managedObjectContext) var managedObjectContext: NSManagedObjectContext

    @State var budgetName: String = ""
    @State var timePeriodUnitRawValue: String = TimePeriodUnit.month.rawValue
    @State var timePeriodQuantity: String = ""
    
    let timePeriodUnits = TimePeriodUnit.allCases.map { $0.rawValue }
    
    var body: some View {
        VStack(spacing: 10) {
            TextField("Budget Name", text: $budgetName)
                .font(.title)
                .multilineTextAlignment(.center)
            HStack {
                Text("Repeat every")
                TextField("#", text: $timePeriodQuantity)
                    .frame(width: 40)
                    .multilineTextAlignment(.center)
                Picker(selection: $timePeriodUnitRawValue, label: Text("Select a repeating interval:")) {
                    ForEach(0..<timePeriodUnits.count) { index in
                        Text(self.timePeriodUnits[index])
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Button(action: createBudget) {
                Text("Create")
                    .foregroundColor(.black)
                .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                    .background(Color(.red))
                .cornerRadius(8)
            }
            .buttonStyle(PlainButtonStyle())
            
            Button(action: {}) {
                Text("Dismiss")
            }
        }
        .padding()
    }
    
    func createBudget() {
        let newBudget = Budget(name: "Test Budget", resetFrequency: TimePeriod(unit: .month, quantity: 1), managedObjectContext: managedObjectContext)
        newBudget.addBudgetPeriod()
        newBudget.user = user
    }
}

struct AddBudgetView_Previews: PreviewProvider {
    static var previews: some View {
        AddBudgetView()
    }
}
