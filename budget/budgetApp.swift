//
//  budgetApp.swift
//  budget
//
//  Created by hamid on 27/05/2024.
//

import SwiftUI

@main
struct budgetApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                BudgetListScreen()
            }
        }
        .modelContainer(for: Budget.self)
    }
}
