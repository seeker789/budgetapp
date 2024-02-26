//
//  AddExpenseView.swift
//  budgetapp
//
//  Created by Süleyman Can Yılmaz on 26.02.2024.
//

import SwiftUI
import SwiftData
struct AddExpenseView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    ///View Properties
    @State private var title: String = ""
    @State private var subTitle: String = ""
    @State private var date: Date = .init()
    @State private var amount: CGFloat = 0
    @State private var category: Category?
    @Query(animation: .snappy) private var allCategories: [Category]
    /// disabling Add Button, Until all data has been entered
    var isAddButtonDisabled: Bool {
        return title.isEmpty || subTitle.isEmpty || amount == .zero
    }
    var body: some View {
        NavigationStack {
            List{
                Section("Title"){
                  TextField("Magic Keyboard", text: $title)
                }
                Section("Description"){
                  TextField("Bought a keyboard at the apple store", text: $subTitle)
                }
                Section("Amount Spend"){
                    HStack(spacing: 4){
                        Text ("$")
                            .fontWeight(.semibold)
                        TextField("0.0", value: $amount, formatter: formatter)
                            .keyboardType(.numberPad)
                    }

                }
                Section("Date"){
                    DatePicker("", selection: $date, displayedComponents: [.date])
                        .datePickerStyle(.graphical)
                        .labelsHidden()
                }
                ///category picker
                if allCategories.isEmpty {
                    HStack {
                        Text("Category")
                        Spacer ()
                        Picker("", selection: $category){
                            ForEach(allCategories){
                                Text($0.categoryName)
                                    .tag($0)
                            }
                        }
                        .pickerStyle(.menu)
                        .labelsHidden()
                    }
                }
            }
            .navigationTitle("Add Expense")
            .toolbar {
                ///Cancel & Add Button
                ToolbarItem(placement: .topBarLeading){
                    Button("Cancel") {
                        dismiss()
                    }
                    .tint(.red)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add", action: addExpense)
                        .disabled(isAddButtonDisabled)
                }
            }
            
        }
    }
    /// Adding Expense to the swift data
    func addExpense() {
        let expense = Expense(title: title , subTitle: subTitle, amount: amount, date: date, category: category)
        context.insert(expense)
        ///Closing View, Once the data added
        dismiss()
    }
}



var formatter: NumberFormatter{
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.maximumFractionDigits = 2
    return formatter
}
/// decimal formatter
#Preview {
  AddExpenseView()
}
