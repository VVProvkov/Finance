//
//  TransactionEntity.swift
//  Finance
//
//  Created by Vadim on 02.02.2022.
//

import Foundation
import CoreData

class CategoryEntity: NSManagedObject {
    
    class func findOrCreate(_ category: Category, context: NSManagedObjectContext) throws -> CategoryEntity {
      
        if let categoryEntity = try? CategoryEntity.find(categoryName: category.name, context: context) {
            return categoryEntity
        } else {
        let entity = CategoryEntity(context: context)
        entity.name = category.name
        entity.emoji = category.emoji
        return entity
        }
    }
    
    class func find(categoryName: String, context: NSManagedObjectContext) throws -> CategoryEntity? {
        let request: NSFetchRequest<CategoryEntity> = CategoryEntity
            .fetchRequest()
        request.predicate = NSPredicate(format: "name == %@", categoryName)
        do {
            let result = try context.fetch(request)
            if result.count > 0 {
                assert(result.count == 1, "Dublicates in CategoryEntity")
                return result[0]
            }
        } catch {
            throw error
        }
        return nil
    }
}
