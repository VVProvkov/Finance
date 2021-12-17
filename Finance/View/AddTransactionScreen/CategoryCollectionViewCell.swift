//
//  CategoryCell.swift
//  Finance
//
//  Created by Vadim on 07.12.2021.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    var label: UILabel = {
        let label = UILabel()
        label.text = "👾"
        label.font = UIFont(name: label.font.fontName, size: 40)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
        contentView.backgroundColor = .red
        contentView.isUserInteractionEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
