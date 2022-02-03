//
//  TransactionsByOneMonth.swift
//  Finance
//
//  Created by Vadim on 31.01.2022.
//

import Foundation

class TransactionsByOneMonthHelper {
    func getTransactionsBy(month: Month, transactions: [Transaction]) -> [Transaction] {
        var transactionsByMonth = [Transaction]()
        for transaction in transactions {
            let date = transaction.date
            let calendareDate = Calendar.current.dateComponents([.month], from: date)
            let numMonth = calendareDate.month
            if month.number == numMonth {
                transactionsByMonth.append(transaction)
            }
        }
        return transactionsByMonth
    }
}
