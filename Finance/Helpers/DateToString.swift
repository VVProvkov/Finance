//
//  Date+ ext.swift
//  Finance
//
//  Created by Vadim on 16.01.2022.
//

import Foundation

extension Date {
    func dateToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        dateFormatter.timeZone = .current
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
}

