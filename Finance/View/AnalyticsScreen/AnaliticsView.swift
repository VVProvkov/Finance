//
//  AnaliticsView.swift
//  Finance
//
//  Created by Vadim on 18.01.2022.
//

import UIKit

class AnaliticsView: UIView {

   
    var typeTransactionsSegmentedControl = UISegmentedControl()
    var monthsStackView = UIStackView()
    var delegate: DidChangedTypeTrtansactionsDelegate?
    
    
    func configureMonthsStackView() {
        let leftButton = UIButton()
        leftButton.setImage(UIImage(systemName: "chevron.left.circle.fill"), for: .normal)
        let rightButton = UIButton()
        rightButton.setImage(UIImage(systemName: "chevron.right.circle.fill"), for: .normal)
        
        var monthLabel = UILabel()
        monthLabel.text = "Месяц"
        monthLabel.textAlignment = .center
        monthsStackView.addArrangedSubview(leftButton)
        monthsStackView.addArrangedSubview(monthLabel)
        monthsStackView.addArrangedSubview(rightButton)
        monthsStackView.axis = .horizontal
        monthsStackView.distribution = .fillEqually
        self.addSubview(monthsStackView)
        monthsStackView.setConstraintsForSize(width: nil, height: 50)
        monthsStackView.setHorizontalConstraintsTo(superView: self, left: 16, right: 16)
        monthsStackView.setVerticalConstraintsFrom(view: typeTransactionsSegmentedControl, top: 5, bottom: nil)
    }
    
    func createTypeTransactionsSegmentedControl() {
        let items = ["Доходы", "Расходы"]
        typeTransactionsSegmentedControl = UISegmentedControl(items: items)
        typeTransactionsSegmentedControl.selectedSegmentIndex = 0
        typeTransactionsSegmentedControl.addTarget(self, action: #selector(didChangeTypeTransactions), for: .valueChanged)
        self.addSubview(typeTransactionsSegmentedControl)
        typeTransactionsSegmentedControl.setHorizontalConstraintsTo(superView: self, left: 16, right: 16)
        typeTransactionsSegmentedControl.setVerticalConstraintsTo(superView: self, top: 60, bottom: nil)
    }
    
    
    @objc func didChangeTypeTransactions(_ segmentedControl: UISegmentedControl) {
        delegate?.didChanged(self)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.setupHeaderTo(view: self, title: "Аналитика", popViewController: false)
        self.backgroundColor = .white
        createTypeTransactionsSegmentedControl()
        configureMonthsStackView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
