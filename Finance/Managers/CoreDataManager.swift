//
//  CoreDataManager.swift
//  Finance
//
//  Created by Vadim on 02.02.2022.
//

import Foundation
import CoreData

class CoreDataManager {
    static var shared = CoreDataManager()
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataBase")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    private init() {}
    
    func getAllTransactions(_ complitionHandler: @escaping ([Transaction]) -> Void) {
        let viewContext = persistentContainer.viewContext
        viewContext.perform {
            let transactionEntities = try? TransactionEntity.all(viewContext)
            let transactions = transactionEntities?.map { Transaction(entity: $0) }
            complitionHandler(transactions ?? [])
        }
    }
    
    func save(transactions: [Transaction]) {
        let viewContext = persistentContainer.viewContext
        viewContext.perform {
            for transaction in transactions {
                _ = try? TransactionEntity.findOrCreate(transaction, context: viewContext)
            }
            try? viewContext.save()
        }
    }
    
    func save(categories: [Category]) {
        let viewContext = persistentContainer.viewContext
        viewContext.perform {
            for category in categories {
                _ = try? CategoryEntity.findOrCreate(category, context: viewContext)
            }
            try? viewContext.save()
        }
    }
}

