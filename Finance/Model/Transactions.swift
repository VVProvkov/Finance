//
//  Transacions.swift
//  Finance
//
//  Created by Vadim on 16.12.2021.
//

import Foundation
import UserNotifications

struct Transactions {
    static var transactions = [Transaction]()
    static func addNewTransaction(transaction: Transaction) {
        self.transactions.append(transaction)
        NotificationCenter.default.post(name: NSNotification.Name("addedNewTransaction"), object: self)
    }
    
    

}
