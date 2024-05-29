//
//  Transaction.swift
//  budget
//
//  Created by hamid on 28/05/2024.
//

import Foundation
import SwiftData


@Model
final class Transaction{
    
    var note:String
    var amount: Double
    var date: Date
    var hasReceip: Bool
    var budget: Budget?
    
    init(note: String, amount: Double, date: Date, hasReceip: Bool = false) {
        self.note = note
        self.amount = amount
        self.date = date
        self.hasReceip = hasReceip
    }
}
