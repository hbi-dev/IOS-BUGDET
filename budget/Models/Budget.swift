//
//  Budget.swift
//  budget
//
//  Created by hamid on 27/05/2024.
//

import Foundation
import SwiftData

@Model//pour persister
final class Budget {
    var name: String
    var limit: Double
    
    @Relationship(deleteRule:.cascade) //quand on suprime un budget on suprime toutes les transactions liés
    var transactions: [Transaction] = []
    
    init(name: String, limit: Double) {
        self.name = name
        self.limit = limit
    }
    
    func addTransaction(_ transaction: Transaction) {
        self.transactions.append(transaction)
    }
    
    
}
