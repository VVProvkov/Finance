//
//  AnalitycsPageViewController.swift
//  Finance
//
//  Created by Vadim on 18.01.2022.
//

import UIKit

class AnalitycsPageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    var transactionsByType = [Transaction]() {
        didSet {
            self.months = monthsFromTransactionsHelper.getMonthsFromTransactions(transactions: self.transactionsByType)
        }
    }
    
    var pageControl = UIPageControl.appearance(whenContainedInInstancesOf: [UIPageViewController.self])
    let transactionsByMonthHelper = TransactionsByOneMonthHelper()
    let monthsFromTransactionsHelper = MonthsFromDatesOfTransactionsHelper()
    lazy var arrayViewControllers = [ContentAnaliticsViewController]()
    
    var analiticsByMonths = [AnaliticsByMonth]()
    var months = [Month]() {
        didSet {
            arrayViewControllers = []
            analiticsByMonths = []
            self.months.sort(by: {$0.number > $1.number})
            for month in months {
                print(month.name)
                print(month.number)
                let transactionsByMonth = transactionsByMonthHelper.getTransactionsBy(month: month, transactions: transactionsByType)
                analiticsByMonths.append(AnaliticsByMonth(transactions: transactionsByMonth, month: month.name))
            }
            arrayViewControllers = createViewControllersForPageViewControllers(analiticsByMonths: analiticsByMonths)
            setViewControllers([arrayViewControllers[0]], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func createViewControllersForPageViewControllers(analiticsByMonths: [AnaliticsByMonth]) -> [ContentAnaliticsViewController] {
        var arrayViewController = [ContentAnaliticsViewController]()
        guard !analiticsByMonths.isEmpty else { return
            [ContentAnaliticsViewController(analiticsByMonth: AnaliticsByMonth(transactions: self.transactionsByType, month: ""))]
        }
        for analiticsByMonth in analiticsByMonths {
            arrayViewController.append(ContentAnaliticsViewController(analiticsByMonth: analiticsByMonth))
        }
        return arrayViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray6
        self.delegate = self
        self.dataSource = self
        pageControl.currentPageIndicatorTintColor = .systemBlue
        pageControl.hidesForSinglePage = true
        print("viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func loadView() {
        super.loadView()
        print("loadView")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewDidLayoutSubviews() {
        pageControl.subviews.forEach {
            $0.transform = CGAffineTransform(scaleX: 4, y: 4)
        }
    }
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        print("инициализация")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? ContentAnaliticsViewController else { return nil }
        if let index = arrayViewControllers.firstIndex(of: viewController) {
            if index > 0 {
                return arrayViewControllers[index - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? ContentAnaliticsViewController else { return nil }
        if let index = arrayViewControllers.firstIndex(of: viewController) {
            if index < arrayViewControllers.count - 1 {
                return arrayViewControllers[index + 1]
            }
        }
        return nil
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return months.count == 1 ? 0 : months.count - 1
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return months.count
    }
}
    

