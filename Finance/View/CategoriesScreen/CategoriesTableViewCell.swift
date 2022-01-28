//
//  TableViewCell.swift
//  Finance
//
//  Created by Vadim on 19.12.2021.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {

    let identifier = "cell"
    var noteLabel = UILabel()
    var categoryLabel = UILabel()
    
    func set(category: Category) -> () {
        noteLabel.text = category.name
        categoryLabel.text = category.emoji
    }
    
    func configureNoteLabel() {
        noteLabel.numberOfLines = 0
        noteLabel.adjustsFontSizeToFitWidth = true
        self.addSubview(noteLabel)
        noteLabel.setCenterYAnchor(superView: self)
        noteLabel.setHorizontalConstraintsFrom(view: categoryLabel, left: 20, right: nil)
        noteLabel.setConstraintsForSize(width: nil, height: 80)
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

