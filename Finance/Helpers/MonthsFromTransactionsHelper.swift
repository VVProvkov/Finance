//
//  DatesOfTransactions.swift
//  Finance
//
//  Created by Vadim on 28.01.2022.
//

import Foundation

class MonthsFromDatesOfTransactionsHelper {
    
    func getMonthsFromTransactions(transactions: [Transaction]) -> [Month] {
        let datesOfTransactionsHelper = DatesFromTransactionsHelper()
        let dates = datesOfTransactionsHelper.getDatesFromTransactions(transactions: transactions)
        var months = [Month]()
        var numDate: Int = 0
        var strDate = ""
        
        for var date in dates {
            let calendareDate = Calendar.current.dateComponents([.month], from: date)
            numDate = calendareDate.month ?? 13
            switch numDate {
            case 1: strDate = NamesOfMonths.Jan.rawValue
            case 2: strDate = NamesOfMonths.Feb.rawValue
            case 3: strDate = NamesOfMonths.Mar.rawValue
            case 4: strDate = NamesOfMonths.Apr.rawValue
            case 5: strDate = NamesOfMonths.May.rawValue
            case 6: strDate = NamesOfMonths.Jun.rawValue
            case 7: strDate = NamesOfMonths.Jul.rawValue
            case 8: strDate = NamesOfMonths.Aug.rawValue
            case 9: strDate = NamesOfMonths.Sep.rawValue
            case 10: strDate = NamesOfMonths.Oct.rawValue
            case 11: strDate = NamesOfMonths.Nov.rawValue
            case 12: strDate = NamesOfMonths.Dec.rawValue
            case 13: strDate = ""
            default: break
            }
            months.append(Month(name: strDate, number: numDate))
        }
        return months
    }
    

}
