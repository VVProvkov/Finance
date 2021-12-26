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
    var selectedCategory: Category? {
        didSet {
            addTransactionView.choiceCategoryButton.setTitle("\(selectedCategory!.emoji) \(selectedCategory!.name)", for: .normal)
        }
    }



    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(addTransactionView)
        addTransactionView.pin(to: self.view)
        addTransactionView.delegate = self
        
        
    }
}


extension AddTransactionViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}


extension AddTransactionViewController: ButtonDelegate {
    func tapButton(_ view: AddTransactionView, sender: UIButton) {
        
        if sender.tag == 0 {
            let categoriesTableVC = CategoriesTableViewController()
            self.navigationController?.pushViewController(categoriesTableVC, animated: true)
        } else {
            guard let selectedCategory = selectedCategory  else { return print("не выбрана категория")}
            
            guard let summString = self.addTransactionView.summTextField.text else { return }
            let summ = Int(summString) ?? 0
        
            let note = self.addTransactionView.noteTextField.text ?? ""
            Transactions.addNewTransaction(transaction: Transaction(note: note, category: selectedCategory, summ: summ))
            self.dismiss(animated: true, completion: nil)
        }
        
        
    }
    
    

    
}
