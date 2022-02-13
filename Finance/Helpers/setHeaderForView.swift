//
//  UIView+Ext.swift
//  Phin2
//
//  Created by Vadim on 30.11.2021.
//

import UIKit

extension UIView {

    func setupHeaderTo(view: UIView, title: String, popViewController popVC: Bool) {
        let header = UIView()
        header.backgroundColor = .systemBackground
        view.addSubview(header)
        header.setConstraintsForSize(width: nil, height: 60)
        header.setHorizontalConstraintsTo(superView: view, left: 0, right: 0)
        let headerLabel = UILabel()
        headerLabel.text = title
        headerLabel.textAlignment = .center
        header.addSubview(headerLabel)
        headerLabel.setConstraintsForSize(width: 300, height: 50)
        headerLabel.setCenterXAnchor(superView: header)
        headerLabel.setCenterYAnchor(superView: header)
        
        if popVC {
            header.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            headerLabel.font = UIFont.boldSystemFont(ofSize: 22)
            header.backgroundColor = .systemGray6
        } else {
            header.setVerticalConstraintsTo(superView: view, top: 0, bottom: nil)
            headerLabel.font = UIFont.boldSystemFont(ofSize: 32)
        }
    }  
}

