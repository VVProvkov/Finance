//
//  TransactionsTableViewCell.swift
//  Phin2
//
//  Created by Vadim on 29.11.2021.
//

import UIKit

class TransactionsTableViewCell: UITableViewCell {

    var noteLabel = UILabel()
    var categoryLabel = UILabel()
    var summLabel = UILabel()
    
    func set(transaction: Transaction) -> () {
        noteLabel.text = transaction.note
        categoryLabel.text = transaction.category.emoji
        summLabel.text = transaction.type == .income ?  "+\(transaction.summ)" : "-\(transaction.summ)"
        summLabel.textColor = transaction.type == .income ? UIColor.systemGreen : .red
    }
    
    func configureNoteLabel() {
        noteLabel.numberOfLines = 0
        noteLabel.adjustsFontSizeToFitWidth = true
        self.addSubview(noteLabel)
        noteLabel.setCenterYAnchor(superView: self)
        noteLabel.setHorizontalConstraintsFrom(view: categoryLabel, left: 20, right: nil)
        noteLabel.setConstraintsForSize(width: nil, height: 80)
    }
    
    func configureSummLabel() {
        summLabel.numberOfLines = 0
        summLabel.adjustsFontSizeToFitWidth = true
        self.addSubview(summLabel)
        summLabel.setCenterYAnchor(superView: self)
        summLabel.setHorizontalConstraintsTo(superView: self, left: nil, right: 12)
        summLabel.setConstraintsForSize(width: nil, height: 80)
    }
    
    func configureCategoryLabel() {
        categoryLabel.numberOfLines = 0
        categoryLabel.adjustsFontSizeToFitWidth = true
        self.addSubview(categoryLabel)
        categoryLabel.setCenterYAnchor(superView: self)
        categoryLabel.setHorizontalConstraintsTo(superView: self, left: 20, right: nil)
        categoryLabel.setConstraintsForSize(width: nil, height: 80)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCategoryLabel()
        configureNoteLabel()
        configureSummLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
