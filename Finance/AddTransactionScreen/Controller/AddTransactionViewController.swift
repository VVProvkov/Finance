//
//  AddVCViewController.swift
//  Phin2
//
//  Created by Vadim on 01.12.2021.
//

import UIKit

class AddTransactionViewController: UIViewController {

    var addTransactionView = AddTransactionView()
    var delegate: AddTransactionToTransactionsDelegate?
    
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
        addTransactionView.summTextField.delegate = self
        
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "", message: "Не выбрана категория", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }

}

extension AddTransactionViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}

extension AddTransactionViewController: AddTransactionButtonDelegate {
    func tapButton(_ view: AddTransactionView, sender: UIButton) {
        if sender.tag == 0 {
            let categoriesTableVC = CategoriesTableViewController()
            self.navigationController?.pushViewController(categoriesTableVC, animated: true)
        } else {
            guard let selectedCategory = selectedCategory  else { return showAlert()}
            guard let summString = view.summTextField.text else { return }
            let summ = Int(summString) ?? 0
            let note = view.noteTextField.text ?? ""
            let date = view.todaysDate
            let type = view.expenseButton.isSelected ? TypeTransaction.expense : .income
            let transaction = Transaction(note: note, category: selectedCategory, summ: summ, date: date, type: type)
            delegate?.tapButton(transaction)
            self.dismiss(animated: true, completion: nil)
        }
    }
}
