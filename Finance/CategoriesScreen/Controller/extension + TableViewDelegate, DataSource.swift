//
//  CategoriesScreen + TableViewDelegate:DataSourcee.swift
//  Finance
//
//  Created by Vadim on 08.02.2022.
//

import Foundation
import UIKit

extension CategoriesTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories.count + 1
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let lastIndex = categories.count
        
        if indexPath.row == lastIndex {
            if let addCell = tableView.dequeueReusableCell(withIdentifier: "addCategoryCell", for: indexPath) as? AddCategoryTableViewCell {
                return addCell
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CategoriesTableViewCell {
                cell.set(category: categories[indexPath.row])
                return cell
            }
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let lastIndex = categories.count
        if indexPath.row == lastIndex {
            let addCategoryVC = AddCategoryViewController()
            addCategoryVC.delegate = self
            present(addCategoryVC, animated: true, completion: nil)
        } else {
            let selectedCategory = categories[indexPath.row]
            guard let AddTransactionVC = self.navigationController?.viewControllers.first as? AddTransactionViewController else { return }
            AddTransactionVC.selectedCategory = selectedCategory
            self.navigationController?.popViewController(animated: true)
        }

    }
  
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = deleteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Delete") { [unowned self] action, view, completion in
            let categoryForRemove = self.categories.remove(at: indexPath.row)
            coreDataManager.delete(category: categoryForRemove)
        }
        action.backgroundColor = .systemRed
        action.image = UIImage(systemName: "trash")
        return action
    }
}
