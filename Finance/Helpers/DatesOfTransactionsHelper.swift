//
//  DatesOfTransactions.swift
//  Finance
//
//  Created by Vadim on 28.01.2022.
//

import Foundation

class DatesFromTransactionsHelper {
    func getDatesFromTransactions(transactions: [Transaction]) -> [Date] {
        var dates = [Date]()
        for transaction in transactions {
            let transactionDate = transaction.date
            if dates.isEmpty {
                dates.append(transactionDate)
            }
            var newDate = false
            for date in dates {
                if date == transactionDate {
                    newDate = false
                    break
                } else {
                    newDate = true
                }
            }
            if newDate {
                dates.append(transactionDate)
            }
        }
        return dates
    }
}
