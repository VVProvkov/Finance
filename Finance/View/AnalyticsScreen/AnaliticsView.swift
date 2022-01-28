//
//  AnaliticsView.swift
//  Finance
//
//  Created by Vadim on 18.01.2022.
//

import UIKit

class AnaliticsView: UIView {

    var incomesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: label.font.fontName, size: 22)
        return label
    }()
    var expencesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: label.font.fontName, size: 22)
        return label
    }()
    
    var middleIncomes = UILabel()
    var middleExpences = UILabel()
    var stackView = UIStackView()

    
    func configureStackView() {
        stackView.addArrangedSubview(incomesLabel)
        stackView.addArrangedSubview(expencesLabel)
        self.addSubview(stackView)
        stackView.pin(to: self)
    }
    
    
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(transactionsData: TransactionsAnaliticsData) {
        self.init(frame: .zero)
        configureStackView()
        incomesLabel.text = String(transactionsData.totalIncomes)
        expencesLabel.text = String(transactionsData.totalExpences)
    }
    
    
    
}
