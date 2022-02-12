//
//  AddButtonDelegate.swift
//  Finance
//
//  Created by Vadim on 16.12.2021.
//

import Foundation
import UIKit

protocol AddTransactionToTransactionsDelegate: AnyObject {
    func tapButton(_ transaction: Transaction)
}
