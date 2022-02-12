//
//  TransactionEntity.swift
//  Finance
//
//  Created by Vadim on 02.02.2022.
//

import Foundation
import CoreData

class TransactionEntity: NSManagedObject {
    
    var type: TypeTransaction {
        get {
            return TypeTransaction(rawValue: self.typeTransaction)!
        }
        
        set {
            self.typeTransaction = newValue.rawValue
        }
    }
    
    class func findOrCreate(_ transaction: Transaction, context: NSManagedObjectContext) throws -> TransactionEntity? {
        
        let request: NSFetchRequest<TransactionEntity> =
        TransactionEntity.fetchRequest()
        request.predicate = NSPredicate(format: "identifier == %@", transaction.identifier)
        
        do {
            let fetchResult =  try context.fetch(request)
            if fetchResult.count > 0 {
                assert(fetchResult.count == 1, "Dublicate has been found in DB!")
                return fetchResult[0]
            }
            if let categoryEntity = try? CategoryEntity.find(categoryName: transaction.category.name, context: context) {
                let transactionEntity = TransactionEntity(context: context)
                transactionEntity.identifier = transaction.identifier
                transactionEntity.summ = Int32(transaction.summ)
                transactionEntity.type = transaction.type
                transactionEntity.date = transaction.date
                transactionEntity.note = transaction.note
                transactionEntity.category = categoryEntity
                return transactionEntity
            }
        } catch {
            throw error
        }
        return nil
    }
    
    class func all(_ context: NSManagedObjectContext) throws -> [TransactionEntity] {
        let request: NSFetchRequest<TransactionEntity> =
        TransactionEntity.fetchRequest()
        
        do {
            return try context.fetch(request)
        } catch {
            throw error
        }
    }
    
}
