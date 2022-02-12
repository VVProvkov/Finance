//
//  Transaction.swift
//  Phin2
//
//  Created by Vadim on 29.11.2021.
//

import Foundation

struct Transaction: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func ==(lhs: Transaction, rhs: Transaction) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var note: String
    var summ: Int
    var category: Category
    var date: Date
    var type: TypeTransaction
    var identifier: String

    init(note: String, category: Category, summ: Int, date: Date, type: TypeTransaction) {
        self.note = note
        self.category = category
        self.summ = summ
        self.date = date
        self.type = type
        self.identifier = UUID().uuidString
    }
    
    init(entity: TransactionEntity, category: Category) {
        self.note = entity.note ?? ""
        self.summ = Int(entity.summ)
        self.date = entity.date ?? Date()
        self.type = entity.type
        self.identifier = entity.identifier!
        self.category = category
    }
}
