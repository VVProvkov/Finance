//
//  UIView+Ext.swift
//  Phin2
//
//  Created by Vadim on 30.11.2021.
//

import UIKit

extension UIView {

    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }

    func setConstraintsForSizeTo(width: CGFloat?, height: CGFloat?) {
        translatesAutoresizingMaskIntoConstraints = false
        if let width = width { widthAnchor.constraint(equalToConstant: width).isActive = true }
        if let height = height { heightAnchor.constraint(equalToConstant: height).isActive = true }
    }
    
    func setVerticalConstraintsTo(superView view: UIView, top: CGFloat?, bottom: CGFloat?) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top { topAnchor.constraint(equalTo: view.topAnchor, constant: top).isActive = true }
        if let bottom = bottom { bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottom).isActive = true }
    }
    
    func setHorizontalConstraintsTo(superView view: UIView, left: CGFloat?, right: CGFloat?) {
        translatesAutoresizingMaskIntoConstraints = false
        if let left = left { leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: left).isActive = true }
        if let right = right { trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(right)).isActive = true }
    }
}
