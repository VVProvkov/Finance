//
//  Transacions.swift
//  Finance
//
//  Created by Vadim on 16.12.2021.
//

import Foundation

struct Transactions {
    static var transactions = [Transaction]()
    static func addNewTransaction(transaction: Transaction) {
        self.transactions.append(transaction)
    }
}
