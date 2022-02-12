//
//  extensions.swift
//  Finance
//
//  Created by Vadim on 26.01.2022.
//

import Foundation
import UIKit

extension TransactionsViewController: UITableViewDelegate, UITableViewDataSource {
    
    override func viewWillLayoutSubviews() {
        transactionsTableView.setVerticalConstraintsTo(superView: self.view, top: 60, bottom: 0)
        transactionsTableView.setHorizontalConstraintsTo(superView: self.view, left: 0, right: 0)
    }
    
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
        let transactions = self.transactions.filter { $0.date == date }
        return transactions.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(40)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = transactionsTableView.dequeueReusableCell(withIdentifier: identifierCell, for: indexPath) as! TransactionsTableViewCell
        
        let date = self.dates[indexPath.section]
        let transactions = self.transactions.filter { $0.date == date }
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
            let date = self.dates[indexPath.section]
            let transactions = self.transactions.filter { $0.date == date }
            let transaction = transactions[indexPath.row]
            self.transactions.remove(at: indexPath.row)
            self.coreDataManager.delete(transaction: transaction)
        }
        action.backgroundColor = .systemRed
        action.image = UIImage(systemName: "trash")
        return action
    }
    
}

