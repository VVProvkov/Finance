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

    var monthsFromTransactionsHelper = MonthsFromDatesOfTransactionsHelper()
    var transactionsByMonthHelper = TransactionsByOneMonthHelper()
    
    
    var transactionsByType = [Transaction]() {
        didSet {
            months = monthsFromTransactionsHelper.getMonthsFromTransactions(transactions: self.transactionsByType)
            analiticksByMonths = [AnaliticsByMonth]()
        }
    }

    var analiticksByMonths = [AnaliticsByMonth]()
    var months = [Month]() {
        didSet {
            for month in months {
                print(month.name)
                let transactionsByMonth = transactionsByMonthHelper.getTransactionsBy(month: month, transactions: transactionsByType)
                print(transactionsByMonth.count)
                analiticksByMonths.append(AnaliticsByMonth(transactions: transactionsByMonth))
            }
            arrayViewController = createViewControllersForPageViewControllers(analiticksByMonths: analiticksByMonths)
            print(arrayViewController?.count)
            if let arrayViewController = arrayViewController {
                pageViewController.setViewControllers([arrayViewController[0]], direction: .forward, animated: true, completion: nil)
            }
        }
    }
    
    var arrayViewController: [ContentAnaliticsViewController]?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(analiticView)
        self.analiticView.pin(to: self.view)
        self.analiticView.delegate = self
        addPageViewController()
        didChanged(analiticView)
        
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name("addedNewTransaction"), object: nil, queue: nil) {
            (notification) in
            if self.analiticView.typeTransactionsSegmentedControl.selectedSegmentIndex == 0 {
                self.transactionsByType = Transactions.shared.getTransactionsByType(type: .income)
            } else {
                self.transactionsByType = Transactions.shared.getTransactionsByType(type: .expense)
            }
        }
        
    }
    
    
    
    
    func createViewControllersForPageViewControllers(analiticksByMonths: [AnaliticsByMonth]) -> [ContentAnaliticsViewController]? {
        var arrayViewController = [ContentAnaliticsViewController]()
        guard !analiticksByMonths.isEmpty else { return
            [ContentAnaliticsViewController(analiticsByMonth: AnaliticsByMonth(transactions: self.transactionsByType))]
        }
        for analiticksByMonth in analiticksByMonths {
            arrayViewController.append(ContentAnaliticsViewController(analiticsByMonth: analiticksByMonth))
            print(analiticksByMonth.totalPerMonthValue)
            print(arrayViewController.last?.totalPerMonthValue)
        }
        
        return arrayViewController
    }
    
    
    func addPageViewController() {
        addChild(pageViewController)
        analiticView.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        pageViewController.delegate = self
        pageViewController.dataSource = self
        pageViewController.view.setHorizontalConstraintsTo(superView: analiticView, left: 0, right: 0)
        pageViewController.view.setVerticalConstraintsFrom(view: analiticView.monthsStackView, top: 5, bottom: nil)
        pageViewController.view.setVerticalConstraintsTo(superView: analiticView, top: nil, bottom: 0)
    }
    
    func didChanged(_ view: AnaliticsView) {
        switch view.typeTransactionsSegmentedControl.selectedSegmentIndex {
        case 0: self.transactionsByType = Transactions.shared.getTransactionsByType(type: .income)
        case 1: self.transactionsByType = Transactions.shared.getTransactionsByType(type: .expense)
        default: break
        }
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension AnalyticsViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? ContentAnaliticsViewController else { return nil }
        guard let arrayViewController = arrayViewController else { return nil}
        if let index = arrayViewController.firstIndex(of: viewController) {
            if index > 0 {
                return arrayViewController[index - 1]
            }
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? ContentAnaliticsViewController else { return nil }
        guard let arrayViewController = arrayViewController else { return nil }
        if let index = arrayViewController.firstIndex(of: viewController) {
            if index < analiticksByMonths.count - 1 {
                return arrayViewController[index + 1]
            }
        }
        return nil
    }
    
 
}
