//
//  ContentViewController.swift
//  Finance
//
//  Created by Vadim on 18.01.2022.
//

import UIKit

class ContentAnaliticsViewController: UIViewController {
    
    var totalPerMonthValue: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial-BoldMT", size: 32)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    var totalPerMonth: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial", size: 14)
        label.text = "Всего за месяц"
        label.textColor = .systemGray
        return label
    }()
    
    var averagePerDayValue: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial-BoldMT", size: 32)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    var averagePerDay: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial", size: 14)
        label.text = "Среднее в день"
        label.textColor = .systemGray
        return label
    }()
    
    let averagePerDayStackView = UIStackView()
    let totalPerMonthStackView = UIStackView()
    let stackView = UIStackView()
    
    
    func configureAveragePerDayStackView(){
        averagePerDayStackView.axis = .vertical
        averagePerDayStackView.addArrangedSubview(averagePerDayValue)
        averagePerDayStackView.addArrangedSubview(averagePerDay)
    }
    
    func configureTotalPerMonthStackView(){
        totalPerMonthStackView.axis = .vertical
        totalPerMonthStackView.addArrangedSubview(totalPerMonthValue)
        totalPerMonthStackView.addArrangedSubview(totalPerMonth)
    }
    
    func configureStackView() {
        stackView.addArrangedSubview(averagePerDayStackView)
        stackView.addArrangedSubview(totalPerMonthStackView)
        stackView.layer.cornerRadius = 16
        stackView.backgroundColor = .systemBackground
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 16, bottom: 16, right: 16)
        stackView.isLayoutMarginsRelativeArrangement = true
        self.view.addSubview(stackView)
        stackView.setConstraintsForSize(width: nil, height: 120)
        stackView.setHorizontalConstraintsTo(superView: self.view, left: 32, right: 32)
        stackView.setVerticalConstraintsTo(superView: self.view, top: 32, bottom: nil)
    }


    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    init(transactionsAnaliticsData: TransactionsAnaliticsData) {
        super.init(nibName: nil, bundle: nil)
        configureTotalPerMonthStackView()
        configureAveragePerDayStackView()
        configureStackView()
        averagePerDayValue.text = "\(transactionsAnaliticsData.totalIncomes) ₽"
        totalPerMonthValue.text = "\(transactionsAnaliticsData.totalExpences) ₽"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
