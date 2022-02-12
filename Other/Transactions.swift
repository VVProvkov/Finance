//
//  Transacions.swift
//  Finance
//
//  Created by Vadim on 16.12.2021.
//

import Foundation
import UserNotifications

class Transactions {
    private init() { }
    static var shared = Transactions()

    var transactions = [Transaction]()

    func addNewTransaction(transaction: Transaction) {
        self.transactions.append(transaction)
        NotificationCenter.default.post(name: NSNotification.Name("addedNewTransaction"), object: self)
    }
    
    func deleteTransaction(transaction: Transaction) {
        self.transactions = self.transactions.filter { $0 != transaction }
        NotificationCenter.default.post(name: NSNotification.Name("deletedTransaction"), object: self)
    }
    
    func getTransactionsByType(type: TypeTransaction) -> [Transaction] {
        var transactions = [Transaction]()
        for transaction in self.transactions {
            if transaction.type == type {
                transactions.append(transaction)
            }
        }
        return transactions
    }
}
