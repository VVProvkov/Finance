//
//  AddVCViewController.swift
//  Phin2
//
//  Created by Vadim on 01.12.2021.
//

import UIKit

class AddTransactionViewController: UIViewController {

    var addTransactionView = AddTransactionView()
    var transaction: Transaction?
    var category: Category?
    
    let sectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(addTransactionView)
        addTransactionView.pin(to: self.view)
        addTransactionView.categoriesCollectionView.delegate = self
        addTransactionView.categoriesCollectionView.dataSource = self
        addTransactionView.delegate = self
    }
}





extension AddTransactionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Categories.numbersOfCategory
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CategoryCollectionViewCell {
//            cell.label.text = Categories.categories[indexPath.row].emoji
//            return cell
//        }
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? TestCollectionViewCell {
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("yf;fk")
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = .green
    }
    
}


extension AddTransactionViewController: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingWidth = sectionInserts.left * (3 + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / 3
        return CGSize(width: widthPerItem, height: widthPerItem)

    }

}

extension AddTransactionViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}


extension AddTransactionViewController: AddButtonDelegate {
    func tapAddButton(_ view: AddTransactionView) {
        self.dismiss(animated: true, completion: nil)
        guard let category = category  else { return }
        Transactions.addNewTransaction(transaction: Transaction(note: "", category: category, summ: 100))
    }
}
