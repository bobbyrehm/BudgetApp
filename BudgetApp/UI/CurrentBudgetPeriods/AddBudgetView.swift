//
//  AddBudgetView.swift
//  BudgetApp
//
//  Created by Bobby Rehm on 6/21/20.
//  Copyright © 2020 Bobby Rehm. All rights reserved.
//

import SwiftUI
import CoreData

struct AddBudgetContainerView: View {
    
    var body: some View {
        NavigationView {
            AddBudgetView()
        }
    }
}

struct AddBudgetView: View {
    
    @EnvironmentObject var user: User
    @Environment(\.managedObjectContext) var managedObjectContext: NSManagedObjectContext
    @Environment(\.presentationMode) var presentationMode

    @State var budgetName = ""
    @State var timePeriodUnitRawValue = TimePeriodUnit.month.rawValue
    @State var timePeriodQuantity = ""
    
    private let timePeriodUnits = TimePeriodUnit.allCases.map { $0.rawValue }
    
    var timePeriodUnitStrings: [String] {
        if timePeriodQuantity == "" {
            return timePeriodUnits.map { "\($0)s" }
        }
        else if let quantity = Int(timePeriodQuantity), quantity != 1 {
            return timePeriodUnits.map { "\($0)s" }
        }
        return timePeriodUnits
    }
    
    var body: some View {
        
        VStack {
            VStack(alignment: .leading) {
                TextField("Name", text: $budgetName)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .padding(10)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(6.0)
            }
            Spacer()
                .frame(height: 20)
            VStack (alignment: .leading) {
                Text("Reset every:")
                HStack {
                    TextField("#", text: $timePeriodQuantity)
                        .frame(maxWidth: 40)
                        .padding(5)
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(6.0)
                    Picker(selection: $timePeriodUnitRawValue, label: Text("Select a repeating interval:")) {
                        ForEach(0..<timePeriodUnits.count) { index in
                            Text(timePeriodUnitStrings[index])
                                .tag(timePeriodUnits[index])
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Create Budget")
        .navigationBarItems(leading: Button("Cancel", action: dismiss), trailing: Button("Add", action: createBudget))
    }
    
    func createBudget() {
                
        guard let timePeriodQuantityInt = Int(timePeriodQuantity) else { fatalError("Invalid time period quantity. timePeriodQuantity = \(timePeriodQuantity)") }
        
        let timePeriodUnit = TimePeriodUnit(unit: timePeriodUnitRawValue)
        
        let newBudget = Budget(name: budgetName, resetFrequency: TimePeriod(unit: timePeriodUnit, quantity: timePeriodQuantityInt), managedObjectContext: managedObjectContext)
        newBudget.addBudgetPeriod()
        newBudget.user = user
        
        dismiss()
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddBudgetView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AddBudgetContainerView()
        }
    }
}
