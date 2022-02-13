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
    
    func pinWithSafeArea(to superView: UIView) {
        
        topAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

    func setConstraintsForSize(width: CGFloat?, height: CGFloat?) {
        translatesAutoresizingMaskIntoConstraints = false
        if let width = width { widthAnchor.constraint(equalToConstant: width).isActive = true }
        if let height = height { heightAnchor.constraint(equalToConstant: height).isActive = true }
    }
    
    func setConstraintsForWidthFrom(view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
    
    func setConstraintsForHeightFrom(view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func setVerticalConstraintsTo(superView view: UIView, top: CGFloat?, bottom: CGFloat?) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top { topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: top).isActive = true }
        if let bottom = bottom { bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -bottom).isActive = true }
    }
    
    func setHorizontalConstraintsTo(superView view: UIView, left: CGFloat?, right: CGFloat?) {
        translatesAutoresizingMaskIntoConstraints = false
        if let left = left { leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: left).isActive = true }
        if let right = right { trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -(right)).isActive = true }
    }

    func setVerticalConstraintsFrom(view: UIView, top: CGFloat?, bottom: CGFloat?) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top { topAnchor.constraint(equalTo: view.bottomAnchor, constant: top).isActive = true }
        if let bottom = bottom { bottomAnchor.constraint(equalTo: view.topAnchor, constant: bottom).isActive = true }
    }
    
    func setHorizontalConstraintsFrom(view: UIView, left: CGFloat?, right: CGFloat?) {
        translatesAutoresizingMaskIntoConstraints = false
        if let left = left { leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: left).isActive = true }
        if let right = right { trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: right).isActive = true }
    }
    
    func setCenterXAnchor(superView view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    func setCenterYAnchor(superView view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

