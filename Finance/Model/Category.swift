//
//  Enum.swift
//  Finance
//
//  Created by Vadim on 15.12.2021.
//

import Foundation

class Category {
    var name: String
    var emoji: String
    
    init(name: String, emoji: String) {
        self.name = name
        self.emoji = emoji
    }
    
    init(entity: CategoryEntity) {
        self.name = entity.name ?? ""
        self.emoji = entity.emoji ?? ""
    }
}
