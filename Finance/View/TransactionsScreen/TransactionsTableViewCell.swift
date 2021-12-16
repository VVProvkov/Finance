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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configureCategoryLabel()
        setCategoryLabelConstrains()
        
        configureNoteLabel()
        setNoteLabelConstrains()
        
        configureSummLabel()
        setSummLabelConstrains()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func set(transaction: Transaction) -> () {
        noteLabel.text = transaction.note
        categoryLabel.text = transaction.category.emoji
        summLabel.text = String(transaction.summ)
    }
    
    func configureNoteLabel() {
        noteLabel.numberOfLines = 0
        noteLabel.adjustsFontSizeToFitWidth = true
        self.addSubview(noteLabel)
    }
    
    func configureSummLabel() {
        summLabel.numberOfLines = 0
        summLabel.adjustsFontSizeToFitWidth = true
        self.addSubview(summLabel)
    }
    
    
    func configureCategoryLabel() {
        categoryLabel.numberOfLines = 0
        categoryLabel.adjustsFontSizeToFitWidth = true
        self.addSubview(categoryLabel)
    }
        
    func setNoteLabelConstrains() {
        noteLabel.translatesAutoresizingMaskIntoConstraints = false
        noteLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        noteLabel.leadingAnchor.constraint(equalTo: categoryLabel.trailingAnchor, constant: 20).isActive = true
        noteLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        //noteLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    func setSummLabelConstrains() {
        summLabel.translatesAutoresizingMaskIntoConstraints = false
        summLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        summLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        summLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    func setCategoryLabelConstrains() {
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        categoryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        categoryLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        //noteLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    
}
