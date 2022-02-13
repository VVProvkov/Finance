//
//  AddCategoryTableViewCell.swift
//  Finance
//
//  Created by Vadim on 13.01.2022.
//

import UIKit

class AddCategoryTableViewCell: UITableViewCell {

    
    let identifier = "addCategoryCell"
    
    var addButton = UIButton()

    func configureAddButton() {
        addButton.setTitle("Добавить категорию", for: .normal)
        addButton.setTitleColor(.systemBlue, for: .normal)
        addButton.setTitleColor(.gray, for: .highlighted)
        addButton.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        addButton.imageView?.tintColor = .systemBlue
        addButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        addButton.layer.cornerRadius = 8
        addButton.tag = 1
        self.addSubview(addButton)
        addButton.setConstraintsForSize(width: nil, height: 40)
        addButton.setCenterXAnchor(superView: self)
    }

    
    @objc func tapButton() {
        print("Button")
    
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureAddButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
