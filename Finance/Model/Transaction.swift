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
    unowned var category: Category
    

    init(note: String, category: Category, summ: Int) {
        self.note = note
        self.category = category
        self.summ = summ
    }
}
