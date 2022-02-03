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
    var datesOfTransactionsHelper = DatesFromTransactionsHelper()
    var dates = [Date]()
    var transactions = [Transaction]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.setupHeaderTo(view: self.view, title: "Все операции", popViewController: false)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let date = dateFormatter.date(from: "12.03.2021")
        
        Transactions.shared.addNewTransaction(transaction: Transaction(note: "First", category: Categories.categories[0], summ: 300, date: date!, type: .income))
        Transactions.shared.addNewTransaction(transaction: Transaction(note: "Second", category: Categories.categories[1], summ: 800, date: date!, type: .expense))
        Transactions.shared.addNewTransaction(transaction: Transaction(note: "Third", category: Categories.categories[2], summ: 200, date: date!, type: .income))
        Transactions.shared.addNewTransaction(transaction: Transaction(note: "Four", category: Categories.categories[3], summ: 400, date: date!, type: .expense))
        
        updateTableView()
        
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name("addedNewTransaction"), object: nil, queue: nil) {
            (notification) in
            self.updateTableView()
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name("deletedTransaction"), object: nil, queue: nil) {
            (notification) in
            self.updateTableView() 
        }

        
        view.backgroundColor = .systemBackground
        transactionsTableView.delegate = self
        transactionsTableView.dataSource = self
        self.view.addSubview(transactionsTableView)
        transactionsTableView.register(TransactionsTableViewCell.self, forCellReuseIdentifier: identifierCell)
    }
    override func viewWillLayoutSubviews() {
        transactionsTableView.setVerticalConstraintsTo(superView: self.view, top: 60, bottom: 0)
        transactionsTableView.setHorizontalConstraintsTo(superView: self.view, left: 0, right: 0)
    }
    
    func updateTableView() {
        self.transactions = Transactions.shared.transactions
        self.dates = datesOfTransactionsHelper.getDatesFromTransactions(transactions: self.transactions)
        self.transactionsTableView.reloadData()
    }
    
}


