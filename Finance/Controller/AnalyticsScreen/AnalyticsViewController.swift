//
//  AnalyticsVC.swift
//  Phin2
//
//  Created by Vadim on 27.11.2021.
//

import UIKit

class AnalyticsViewController: UIViewController {

    var transactionsAnaliticsData: TransactionsAnaliticsData?
    var pageViewController = AnalitycsPageViewController()
    var typeTransactionsSegmentedControl = UISegmentedControl()
    var monthsStackView = UIStackView()
    var transactions = [Transaction]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTypeTransactionsSegmentedControl()
        configureMonthsStackView()
        addPageViewController()
    }

    
    func configureMonthsStackView() {
        let leftButton = UIButton()
        leftButton.setImage(UIImage(systemName: "chevron.left.circle.fill"), for: .normal)
        let rightButton = UIButton()
        rightButton.setImage(UIImage(systemName: "chevron.right.circle.fill"), for: .normal)
        
//        var monthLabel = UILabel()
//        monthLabel.text = String(DatesDictionary.months[0])
        monthsStackView.addArrangedSubview(leftButton)
        //monthsStackView.addArrangedSubview(monthLabel)
        monthsStackView.addArrangedSubview(rightButton)
        monthsStackView.axis = .horizontal
        monthsStackView.distribution = .fillEqually
        self.view.addSubview(monthsStackView)
        monthsStackView.setConstraintsForSize(width: nil, height: 50)
        monthsStackView.setHorizontalConstraintsTo(superView: self.view, left: 16, right: 16)
        monthsStackView.setVerticalConstraintsFrom(view: typeTransactionsSegmentedControl, top: 5, bottom: nil)
        
    }
    
    
    
    func createTypeTransactionsSegmentedControl() {
        let items = ["Доходы", "Расходы"]
        typeTransactionsSegmentedControl = UISegmentedControl(items: items)
        typeTransactionsSegmentedControl.selectedSegmentIndex = 0
        typeTransactionsSegmentedControl.addTarget(self, action: #selector(didChangeTypeTransactions), for: .valueChanged)
        view.addSubview(typeTransactionsSegmentedControl)
        typeTransactionsSegmentedControl.setHorizontalConstraintsTo(superView: self.view, left: 16, right: 16)
        typeTransactionsSegmentedControl.setVerticalConstraintsTo(superView: self.view, top: 60, bottom: nil)
    }
    
    @objc func didChangeTypeTransactions(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0: self.transactions = DatesDictionary.getIncomesTransactions()
        case 1: self.transactions = DatesDictionary.getExpenseTransactions()
        default: break
        }
    }
    
    func addPageViewController() {
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        pageViewController.view.setHorizontalConstraintsTo(superView: view, left: 0, right: 0)
        pageViewController.view.setVerticalConstraintsFrom(view: monthsStackView, top: 5, bottom: nil)
        pageViewController.view.setVerticalConstraintsTo(superView: self.view, top: nil, bottom: 0)
    }

    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.view.setupHeaderTo(view: self.view, title: "Аналитика", popViewController: false)
        self.view.backgroundColor = .white
        
        self.transactionsAnaliticsData = TransactionsAnaliticsData(totalIncomes: 20088, totalExpences: 400000, middleIncomes: 399, middleExpences: 599)
        var arrayViewControllers = [ContentAnaliticsViewController(transactionsAnaliticsData: transactionsAnaliticsData!)]
        pageViewController.setViewControllers([arrayViewControllers[0]], direction: .forward, animated: true, completion: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
}
