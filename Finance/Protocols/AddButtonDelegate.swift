//
//  AddButtonDelegate.swift
//  Finance
//
//  Created by Vadim on 16.12.2021.
//

import Foundation
import UIKit

protocol ButtonDelegate: AnyObject {
    func tapButton(_ view: AddTransactionView, sender: UIButton)
}
