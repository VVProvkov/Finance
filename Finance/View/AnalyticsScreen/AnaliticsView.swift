//
//  AnaliticsView.swift
//  Finance
//
//  Created by Vadim on 18.01.2022.
//

import UIKit

class AnaliticsView: UIView {

   
    var typeTransactionsSegmentedControl = UISegmentedControl()
   
    var delegate: DidChangedTypeTrtansactionsDelegate?

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
        self.backgroundColor = .systemGroupedBackground
        createTypeTransactionsSegmentedControl()
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
