//
//  Transaction.swift
//  Phin2
//
//  Created by Vadim on 29.11.2021.
//

import Foundation

struct Transaction {
    var note: String
    var summ: Int
    var category: Category
    var date: Date
    var type: TypeTransaction

    init(note: String, category: Category, summ: Int, date: Date, type: TypeTransaction) {
        self.note = note
        self.category = category
        self.summ = summ
        self.date = date
        self.type = type
    }
}
