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
    var transactions: [Transaction]?
    
    init(name: String, emoji: String) {
        self.name = name
        self.emoji = emoji
    }
}
