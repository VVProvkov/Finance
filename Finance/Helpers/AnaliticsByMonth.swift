//
//  TransactionsAnaliticsData.swift
//  Finance
//
//  Created by Vadim on 20.01.2022.
//

import Foundation

struct AnaliticsByMonth {
    
    let month: String
    
    var averagePerDayValue: Int {
        totalPerMonthValue / 30
    }
    var totalPerMonthValue: Int
    
    init(transactions: [Transaction], month: String) {
        self.month = month
        var totalSumm = 0
        for transaction in transactions {
            totalSumm += transaction.summ
        }
        self.totalPerMonthValue = totalSumm
    }
}
