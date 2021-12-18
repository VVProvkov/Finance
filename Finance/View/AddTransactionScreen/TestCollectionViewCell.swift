//
//  TestCollectionViewCell.swift
//  Finance
//
//  Created by Vadim on 18.12.2021.
//

import UIKit

class TestCollectionViewCell: UICollectionViewCell {
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //contentView.addSubview(label)
        contentView.backgroundColor = .red
        contentView.isUserInteractionEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
