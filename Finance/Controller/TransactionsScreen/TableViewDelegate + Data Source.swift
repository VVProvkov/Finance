//
//  extensions.swift
//  Finance
//
//  Created by Vadim on 26.01.2022.
//

import Foundation
import UIKit

extension TransactionsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dates.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(40)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let date = self.dates[section]
        let dateString = date.dateToString()
        let label = UILabel()
        label.text = dateString
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.backgroundColor = UIColor.systemBlue
        return label
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        let date = self.dates[section]
        if let transactions = self.datesDictionary[date] {
            return transactions.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(40)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = transactionsTableView.dequeueReusableCell(withIdentifier: identifierCell, for: indexPath) as! TransactionsTableViewCell
        
        let date = self.dates[indexPath.section]
        guard let transactions = self.datesDictionary[date] else { return UITableViewCell()}
        let transaction = transactions[indexPath.row]
        
        cell.set(transaction: transaction)
        return cell
    }
    
    //editing
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = deleteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Delete") { action, view, completion in
            let date = DatesDictionary.dates[indexPath.section]
            guard let transactions = self.datesDictionary[date] else { return }
            let transaction = transactions[indexPath.row]
            DatesDictionary.deleteTransaction(transaction: transaction, index: indexPath.row)
        }
        action.backgroundColor = .systemRed
        action.image = UIImage(systemName: "trash")
        return action
    }
    
}

