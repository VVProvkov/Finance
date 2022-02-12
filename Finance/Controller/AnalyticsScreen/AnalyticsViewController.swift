//
//  AnalyticsVC.swift
//  Phin2
//
//  Created by Vadim on 27.11.2021.
//

import UIKit

class AnalyticsViewController: UIViewController, DidChangedTypeTrtansactionsDelegate {
    
    var analiticView = AnaliticsView()
    var pageViewController = AnalitycsPageViewController()
    var transactions = [Transaction]() {
        didSet {
            didChanged(analiticView)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(analiticView)
        self.analiticView.pin(to: self.view)
        self.analiticView.delegate = self
        addPageViewController()
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name("addedNewTransaction"), object: nil, queue: nil) {
            (notification) in
            CoreDataManager.shared.getAllTransactions { [unowned self] transactions in
                self.transactions = transactions
                self.addPageViewController()
            }
        }
    }
    
    func didChanged(_ view: AnaliticsView) {
        switch view.typeTransactionsSegmentedControl.selectedSegmentIndex {
        case 0: pageViewController.transactionsByType = self.getTransactionsByType(type: .income)
        case 1: pageViewController.transactionsByType = self.getTransactionsByType(type: .expense)
        default: break
        }
    }
    
    func addPageViewController() {
        addChild(pageViewController)
        analiticView.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        pageViewController.view.setHorizontalConstraintsTo(superView: analiticView, left: 0, right: 0)
        pageViewController.view.setVerticalConstraintsFrom(view: analiticView.typeTransactionsSegmentedControl, top: 5, bottom: nil)
        pageViewController.view.setVerticalConstraintsTo(superView: analiticView, top: nil, bottom: 0)
    }

    func getTransactionsByType(type: TypeTransaction) -> [Transaction] {
        var transactions = [Transaction]()
        for transaction in self.transactions {
            if transaction.type == type {
                transactions.append(transaction)
            }
        }
        return transactions
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        CoreDataManager.shared.getAllTransactions { transactions in
            self.transactions = transactions
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
