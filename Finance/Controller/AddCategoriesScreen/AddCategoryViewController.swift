//
//  AddCategpryViewController.swift
//  Finance
//
//  Created by Vadim on 13.01.2022.
//

import UIKit

class AddCategoryViewController: UIViewController, AddCategoryButtonDelegate {

   let addCategoryView = AddCategoryView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(addCategoryView)
        addCategoryView.pin(to: self.view)
        addCategoryView.delegate = self
    }

    func tapButton(_ view: AddCategoryView) {
        guard let nameCategory = view.nameTextField.text else { return }
        guard let symbolCategory = view.symbolTextField.text else { return }
        print("name" + nameCategory)
        print(symbolCategory)
        let newCategory = Category(name: nameCategory, emoji: symbolCategory)
        Categories.addNewCategory(category: newCategory)
        self.dismiss(animated: true)
    }
    
}
