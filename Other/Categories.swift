//
//  Categories.swift
//  Finance
//
//  Created by Vadim on 16.12.2021.
//

import Foundation

struct Categories {
    static var categories = [Category(name: "Food", emoji: "🍽"),
                             Category(name: "Wear", emoji: "👕"),
                             Category(name: "Health", emoji: "🩺"),
                             Category(name: "Health", emoji: "🩺"),
                             Category(name: "Health", emoji: "🩺"),]
    
    static var numbersOfCategory = categories.count
    
    static func addNewCategory(category: Category) {
        self.categories.append(category)
        print(category.name)
        NotificationCenter.default.post(name: NSNotification.Name("addedNewCategory"), object: self)
    }
    
    static func deleteCategory(category: Category, index: Int) {
        self.categories.remove(at: index)
        print(category.name)
        NotificationCenter.default.post(name: NSNotification.Name("deletedCategory"), object: self)
    }
}
