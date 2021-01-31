//
//  AddExpenseView.swift
//  BudgetApp
//
//  Created by Bobby Rehm on 7/1/20.
//  Copyright © 2020 Bobby Rehm. All rights reserved.
//

import SwiftUI

struct AddExpenseView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var budgetPeriod: BudgetPeriod
    
    @State var expenseName = ""
    @State var date = Date()
    @State var amount: Double? = 0.0
    
    var body: some View {
        NavigationView {
            VStack {
                
                HStack {
                    TextField("$0.00", value: $amount, formatter: Formatters.currency)
                        .font(.largeTitle)
                        .keyboardType(.decimalPad)
                    DatePicker("", selection: $date, displayedComponents: .date)
                }
                TextField("Name", text: $expenseName)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .padding(10)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(6.0)
                Spacer()
            }
            .padding()
            .navigationTitle("Add Expense")
            .navigationBarItems(leading: Button("Cancel", action: dismiss), trailing: Button("Add", action: addExpense))
        }
    }
    
    func addExpense() {
        
        budgetPeriod.addExpense(amount: amount ?? 0.0, date: date, name: expenseName, details: "")
        
        dismiss()
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView(budgetPeriod: previewData.clothesBudget.currentBudgetPeriod!)
    }
}
