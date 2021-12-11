//
//  TransactionsTableViewCell.swift
//  Phin2
//
//  Created by Vadim on 29.11.2021.
//

import UIKit

class TransactionsTableViewCell: UITableViewCell {

    

    
    var label = UILabel()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(label)
        
        configureLabelView()
        setLabelConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func set(transaction: Transaction) -> () {
        label.text = transaction.note
    }
    
    func configureLabelView() {
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
    }
        
    func setLabelConstrains() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        label.heightAnchor.constraint(equalToConstant: 80).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    
}
