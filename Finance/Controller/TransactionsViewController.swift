//
//  TransactionsVC.swift
//  Phin2
//
//  Created by Vadim on 27.11.2021.
//

import UIKit

class TransactionsViewController: UIViewController {
    
    
    var identifierCell = "Cell"
    
    var transactionsTableView = UITableView()
    var transactions = [Transaction]() {
        didSet {
            transactionsTableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        transactions.append(Transaction(note: "First", categoty: "Food", summ: 300))
        transactions.append(Transaction(note: "Second", categoty: "Food", summ: 300))
        transactions.append(Transaction(note: "Third", categoty: "Food", summ: 300))
        transactions.append(Transaction(note: "Four", categoty: "Food", summ: 300))
        
        
        
        
        
        
        view.backgroundColor = .systemGroupedBackground
        transactionsTableView = UITableView(frame: CGRect(x: 0 , y: 0 , width: self.view.bounds.width, height: self.view.bounds.height), style: .plain)
  
        transactionsTableView.delegate = self
        transactionsTableView.dataSource = self
        self.view.addSubview(transactionsTableView)
        
        
        transactionsTableView.register(TransactionsTableViewCell.self, forCellReuseIdentifier: identifierCell)
    }
    override func viewWillLayoutSubviews() {
        transactionsTableView.pin(to: self.view)
    }


}


extension TransactionsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        transactions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = transactionsTableView.dequeueReusableCell(withIdentifier: identifierCell, for: indexPath) as! TransactionsTableViewCell
        let transaction = transactions[indexPath.row]
        cell.set(transaction: transaction )
        return cell
    }

}

