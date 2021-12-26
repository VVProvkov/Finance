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
        
        transactions.append(Transaction(note: "First", category: Categories.categories[0], summ: 300))
        transactions.append(Transaction(note: "Second", category: Categories.categories[1], summ: 300))
        transactions.append(Transaction(note: "Third", category: Categories.categories[2], summ: 300))
        transactions.append(Transaction(note: "Four", category: Categories.categories[3], summ: 300))
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name("addedNewTransaction"), object: nil, queue: nil) { (notification) in
            guard let newTransaction = Transactions.transactions.last else { return }
            self.transactions.append(newTransaction)
            
        }
        
        
        view.backgroundColor = .systemBackground
        transactionsTableView = UITableView(frame: CGRect(x: 0 , y: 0 , width: self.view.bounds.width, height: self.view.bounds.height), style: .plain)
  
        transactionsTableView.delegate = self
        transactionsTableView.dataSource = self
        self.view.addSubview(transactionsTableView)
        
        
        transactionsTableView.register(TransactionsTableViewCell.self, forCellReuseIdentifier: identifierCell)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        transactionsTableView.reloadData()
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

