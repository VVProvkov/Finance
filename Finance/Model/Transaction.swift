//
//  Transaction.swift
//  Phin2
//
//  Created by Vadim on 29.11.2021.
//

import Foundation

struct Transaction {
    var note: String
    var category: String
    var summ: Int
    
    
    init(note: String, categoty: String, summ: Int) {
        self.note = note
        self.category = categoty
        self.summ = summ
    }
}
