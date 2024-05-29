//
//  BudgetListScreen.swift
//  budget
//
//  Created by hamid on 27/05/2024.
//

import SwiftUI
import SwiftData

struct BudgetListScreen: View {
    
    @Query private var budgets: [Budget]
    @Environment(\.modelContext) private var context
    
    @State var name: String = ""
    @State var limit: Double?
    
    
    private var isFormValid: Bool{
        !name.isEmptyOrWhiteSpace && limit != nil
    }
    
    private func saveBudget(){
        let budget = Budget(name: name, limit: limit!)
        context.insert(budget) // insert fait un save automatiquement dans la BDD
    }
    
    var body: some View {
        Form{
            Section("New budget"){
                TextField("Name", text: $name)
                TextField("Limit", value: $limit, format: .number)
                    .keyboardType(.numberPad)
                Button("Save"){
                    saveBudget()
                    name = ""
                    limit = nil
                }.disabled(!isFormValid)
            }
            Section("Budgets"){
                List(budgets) { budget in
                    
                    NavigationLink(value: budget){
                        HStack{
                            Text(budget.name)
                            Spacer()
                            Text(budget.limit, format: .currency(code: "USD"))
                        }
                    }
                }
            }
        }
        .navigationTitle("BudgetTracker")
        .navigationDestination(for: Budget.self) { budget in
            BudgetDetailsScreen(budget: budget)
            
        }
        
    }
}

struct BudgetListScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            BudgetListScreen()
                .modelContainer(for: Budget.self)
        }
    }
}
