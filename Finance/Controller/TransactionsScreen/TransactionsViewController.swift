//
//  TransactionsVC.swift
//  Phin2
//
//  Created by Vadim on 27.11.2021.
//

import UIKit

class TransactionsViewController: UIViewController, AddTransactionToTransactionsDelegate {
    
    var identifierCell = "Cell"
    var transactionsTableView = UITableView()
    var datesOfTransactionsHelper = DatesFromTransactionsHelper()
    var coreDataManager = CoreDataManager.shared
    var dates = [Date]() {
        didSet {
            transactionsTableView.reloadData()
        }
    }
    var transactions = [Transaction]() {
        didSet {
            self.dates = datesOfTransactionsHelper.getDatesFromTransactions(transactions: self.transactions)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.setupHeaderTo(view: self.view, title: "Все операции", popViewController: false)
        view.backgroundColor = .systemBackground
        transactionsTableView.delegate = self
        transactionsTableView.dataSource = self
        self.view.addSubview(transactionsTableView)
        transactionsTableView.register(TransactionsTableViewCell.self, forCellReuseIdentifier: identifierCell)
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name("deletedCategory"), object: nil, queue: nil) { (notification) in
            self.coreDataManager.getAllTransactions { [unowned self] transactions in
                self.transactions = transactions
            }
        }
        
    }
    
    func tapButton(_ transaction: Transaction) {
        self.transactions.append(transaction)
        coreDataManager.save(transactions: self.transactions)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        coreDataManager.save(transactions: self.transactions)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        coreDataManager.getAllTransactions { [unowned self] transactions in
            self.transactions = transactions
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


