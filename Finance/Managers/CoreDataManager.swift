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
        let container = NSPersistentContainer(name: "DBModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private init() {}
    
    func getAllCategories(_ complitionHandler: @escaping ([Category]) -> Void) {
        let viewContext = persistentContainer.viewContext
        viewContext.perform {
            let categoryEntities = try? CategoryEntity.all(viewContext)
            let categories = categoryEntities?.map { Category(entity: $0) }
            complitionHandler(categories ?? [])
        }
    }
    
    func getAllTransactions(_ complitionHandler: @escaping ([Transaction]) -> Void) {
        let viewContext = persistentContainer.viewContext
        viewContext.perform {
            let transactionEntities = try? TransactionEntity.all(viewContext)
            let transactions = transactionEntities?.map { Transaction(entity: $0, category: Category(name: $0.category?.name ?? "удаленная категория", emoji: $0.category?.emoji ?? "")) }
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
            NotificationCenter.default.post(name: NSNotification.Name("addedNewTransaction"), object: self)
        }
    }
    
    func save(categories: [Category]) {
        let viewContext = persistentContainer.viewContext
        viewContext.perform {
            for category in categories {
                _ = try? CategoryEntity.findOrCreate(category, context: viewContext)
            }
            try? viewContext.save()
            NotificationCenter.default.post(name: NSNotification.Name("addedNewCategory"), object: self)
        }
    }
    
    func delete(category: Category) {
        let viewContext = persistentContainer.viewContext
        viewContext.perform {
            guard let categoryEntity = try? CategoryEntity.findOrCreate(category, context: viewContext) else { return }
            viewContext.delete(categoryEntity)
            try? viewContext.save()
            NotificationCenter.default.post(name: NSNotification.Name("deletedCategory"), object: self)
        }
    }
    
    func delete(transaction: Transaction) {
        let viewContext = persistentContainer.viewContext
        viewContext.perform {
            guard let transactionEntity = try? TransactionEntity.findOrCreate(transaction, context: viewContext) else { return }
            viewContext.delete(transactionEntity)
            try? viewContext.save()
            NotificationCenter.default.post(name: NSNotification.Name("deletedTransaction"), object: self)
        }
    }
}

