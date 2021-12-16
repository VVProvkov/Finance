//
//  AddVCViewController.swift
//  Phin2
//
//  Created by Vadim on 01.12.2021.
//

import UIKit

class AddTransactionViewController: UIViewController {

    
    var addTransactionView = AddTransactionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(addTransactionView)
        addTransactionView.pin(to: self.view)
        addTransactionView.categoriesCollectionView.delegate = self
        addTransactionView.categoriesCollectionView.dataSource = self
        addTransactionView.delegate = self
    }
}

extension AddTransactionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Categories.numbersOfcategory
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CategoryCollectionViewCell
        cell.label.text = Categories.categories[indexPath.row].emoji
        return cell
    }
}

extension AddTransactionView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}


extension AddTransactionViewController: AddButtonDelegate {
    func tapAddButton(_ view: AddTransactionView) {
        self.dismiss(animated: true, completion: nil)
        print("\(view.summLabel.text)")
    }
}
