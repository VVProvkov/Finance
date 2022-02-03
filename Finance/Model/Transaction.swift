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
    var identifier: Int
    private static var identifierFactory = 0
    private static func getUnigueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init(note: String, category: Category, summ: Int, date: Date, type: TypeTransaction) {
        self.note = note
        self.category = category
        self.summ = summ
        self.date = date
        self.type = type
        self.identifier = Transaction.getUnigueIdentifier()
    }
    
    init(entity: TransactionEntity) {
        self.note = entity.note ?? ""
        self.summ = Int(entity.summ)
        self.date = entity.date ?? Date()
        self.type = entity.type
        self.identifier = Int(entity.identifier)
    }
}
