//
//  BudgetDetailsScreen.swift
//  budget
//
//  Created by hamid on 28/05/2024.
//

import SwiftUI
import SwiftData

struct BudgetDetailsScreen: View {
    
    let budget: Budget
    
    @State private var note:String = ""
    @State private var amount: Double?
    @State private var date: Date = Date()
    @State private var hasReceip: Bool = false
    
    private func saveTransaction(){
        let transaction = Transaction(note: note, amount: amount!, date: date )
        
        /*partie de la relationShip transaction -> budget et Budget -> transaction,
        on update la liste de la relationShip des deux cotés
         */
        transaction.budget = budget // relationShip transaction -> budget (belongsTo relationShip)
        budget.addTransaction(transaction) // relationShip transaction Budget -> transaction (hasMany relationShip)
    }

    private var isFormValid: Bool {
        !note.isEmptyOrWhiteSpace && amount != nil
    }
    
    var body: some View {
        Form{
            
            Section("New transaction") {
                TextField("Note", text: $note)
                TextField("Limit", value: $amount, format: .number)
                    .keyboardType(.numberPad)
                DatePicker("Date", selection: $date)
                Toggle("Receip", isOn: $hasReceip)
                Button("Save Transaction") {
                    saveTransaction()
                }.disabled(!isFormValid)
            }
            Section("Transactions") {
                List(budget.transactions){ transaction in // execution de la query mysql
                    
                    HStack{
                        Text(transaction.note)
                        Spacer()
                        Text(transaction.amount, format: .currency(code: "USD"))
                    }

                }
            }
        }.navigationTitle(budget.name)
    }
}

//#Preview {
//    BudgetDetailsScreen()
//}

