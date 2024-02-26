//
//  ContentView.swift
//  budgetapp
//
//  Created by Süleyman Can Yılmaz on 26.02.2024.
//

import SwiftUI

struct ContentView: View {
    /// view properties
    @State private var currentTab: String = "Expenses"
    var body: some View {
        TabView(selection: $currentTab) {
            ExpensesView()
                .tag("Expenses")
                .tabItem {
                    Image(systemName: "creditcard.fill")
                    Text("Expenses")
                }
            
            CategoriesView()
                .tag("Categories")
                .tabItem {
                    Image(systemName: "List.clipboard.fill")
                    Text("Categories")
                }
        }
    }
}
#Preview {
    ContentView()
    
}
