//
//  TransactionsAnaliticsData.swift
//  Finance
//
//  Created by Vadim on 20.01.2022.
//

import Foundation

struct AnaliticsByMonth {
    var averagePerDayValue: Int {
        totalPerMonthValue / 30
    }
    var totalPerMonthValue: Int
    
    init(transactions: [Transaction]) {
        var totalSumm = 0
        for transaction in transactions {
            totalSumm += transaction.summ
        }
        self.totalPerMonthValue = totalSumm
    }
}
