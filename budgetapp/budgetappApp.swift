//
//  budgetappApp.swift
//  budgetapp
//
//  Created by Süleyman Can Yılmaz on 26.02.2024.
//

import SwiftUI

@main
struct SimpleBudgetAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        ///Setting Up the Container
        .modelContainer(for: [Expense.self, Category.self])
    }
}
