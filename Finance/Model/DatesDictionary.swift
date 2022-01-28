//
//  MonthSection.swift
//  Finance
//
//  Created by Vadim on 15.01.2022.
//

import Foundation

struct DatesDictionary {
    
    static var datesDictionary = [Date : [Transaction]]()
    static var dates = [Date]() {
        didSet {
            for date in dates {
                let calendareDate = Calendar.current.dateComponents([.month], from: date)
                months.append(calendareDate.month!)
            }
        }
    }
    static var months = [Int]() {
        didSet {
            print(months.last)
        }
    }
    static var transactions = [Transaction]()
    
    static func getIncomesTransactions() -> [Transaction] {
        var transactions = [Transaction]()
        for transaction in transactions {
            if transaction.type == .income {
                transactions.append(transaction)
            }
        }
        return transactions
    }
    
    static func getExpenseTransactions() -> [Transaction] {
        var transactions = [Transaction]()
        for transaction in transactions {
            if transaction.type == .expense {
                transactions.append(transaction)
            }
        }
        return transactions
    }

    static func getTransactions(date: Date) -> [Transaction]? {
        if let transactions = self.datesDictionary[date] {
            return transactions
        }
        return nil
    }

    static func addTransaction(transaction: Transaction) {
        //добавляем транзакцию в общий массив
        transactions.append(transaction)
        // проверяем пустой ли словарь, если да, то длобавляем первое ключ - значение (дата - транзакция)
        if datesDictionary.isEmpty {
            datesDictionary = [transaction.date : [transaction]]
            dates.append(transaction.date)
            print("first transaction")
        } else {
            // проверяем есть ли дата входящей транзакции уже в словаре, если есть, то добавляем в массив транзакций этой даты
            var newDate = false
            for var pair in datesDictionary {
                if transaction.date == pair.key {
                    datesDictionary[pair.key]?.append(transaction)
                    newDate = false
                    break
                } else {
                    newDate = true
                }
            }
            //если в словаре нет даты входящей транзакции, то дабавляем новый ключ - значение (дата - транзакция)
            if newDate {
                print("Добавилась новая дата")
                datesDictionary[transaction.date] = [transaction]
                dates.append(transaction.date)
            }
        }
        NotificationCenter.default.post(name: NSNotification.Name("addedDateTransaction"), object: nil)
    }
    
    static func deleteTransaction(transaction: Transaction, index: Int) {
        let date = transaction.date
        datesDictionary[date]?.remove(at: index)
        if datesDictionary[date]!.count == 0 {
            datesDictionary.removeValue(forKey: date)
            self.dates = self.dates.filter{ $0 != date }
        }
        NotificationCenter.default.post(name: NSNotification.Name("deletedDateTransaction"), object: nil)
    }
}
