//
//  ExpenseCardView.swift
//  budgetapp
//
//  Created by Süleyman Can Yılmaz on 26.02.2024.
//

import SwiftUI

struct ExpenseCardView: View {
    @Bindable var expense: Expense
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Text(expense.title)
                
                Text(expense.subTitle)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            .lineLimit(1)
            Spacer(minLength: 5)
            
            ///Currency String
            Text(expense.currencyString)
                .font(.title3.bold())
        }
    }
}
