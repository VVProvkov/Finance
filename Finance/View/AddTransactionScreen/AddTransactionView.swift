//
//  AddTransactionView.swift
//  Finance
//
//  Created by Vadim on 10.12.2021.
//

import Foundation
import UIKit

class AddTransactionView: UIView {
    
    
    var label = UILabel()
    var header = UIView()
    var summTextField = UITextField()
    var incomeButton = UIButton()
    var expenseButton = UIButton()
    var addButton = UIButton()
    
    let categoriesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 70, height: 70)
        let categoriesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return categoriesCollectionView
    }()
    
    func configureHeader() {
        header.backgroundColor = .secondarySystemBackground
        self.addSubview(header)
    }
    
    func setHeaderConstrains() {
        header.translatesAutoresizingMaskIntoConstraints = false
        header.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        header.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        header.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        header.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    
    func configureTextField() {
        summTextField.placeholder = "100 ₽"
        summTextField.backgroundColor = UIColor.systemGray6
        summTextField.layer.cornerRadius = 8
        summTextField.clearButtonMode = .always
        summTextField.leftViewMode = .always
        
        let imageView = UIImageView(image: UIImage(systemName: "plus"))
        imageView.preferredSymbolConfiguration = UIImage.SymbolConfiguration(weight: .bold)
        imageView.tintColor = .systemGray3
        
        summTextField.leftView = imageView
        summTextField.font = .systemFont(ofSize: 24)
        summTextField.keyboardType = .decimalPad
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIView.endEditing))
        self.addGestureRecognizer(tap)
        
        addSubview(summTextField)
    }
    
    func setTextFieldConstrains() {
        summTextField.translatesAutoresizingMaskIntoConstraints = false
        summTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        summTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        summTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        summTextField.topAnchor.constraint(equalTo: self.header.bottomAnchor, constant: 40).isActive = true
    }
    
    func setLabelConstrains() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 200).isActive = true
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        label.centerYAnchor.constraint(equalTo: self.header.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: self.header.centerXAnchor).isActive = true
    }
    
    
    func configureLabel() {
        label.text = "Add transaction"
        label.textAlignment = .center
        self.header.addSubview(label)
    }
    

    func configureIncomeButton() {
        incomeButton.setTitle("Income", for: .normal)
        incomeButton.setTitleColor(.systemBlue, for: .normal)
        incomeButton.backgroundColor = .systemBlue
        incomeButton.setTitleColor(.systemBlue, for: .selected)
        incomeButton.isSelected = true
        incomeButton.setTitleColor(.white, for: .selected)
        incomeButton.addTarget(self, action: #selector(tapIncomeButton), for: .touchUpInside)
        incomeButton.layer.cornerRadius = 8
        self.addSubview(incomeButton)
    }
    
    func setIncomeButtonConstrains() {
        incomeButton.translatesAutoresizingMaskIntoConstraints = false
        incomeButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        incomeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        incomeButton.topAnchor.constraint(equalTo: self.summTextField.bottomAnchor, constant: 20).isActive = true
        incomeButton.leadingAnchor.constraint(equalTo: self.summTextField.leadingAnchor).isActive = true
    }
    
    
    
    func configureExpenseButton() {
        expenseButton.setTitle("Expense", for: .normal)
        expenseButton.setTitleColor(.systemBlue, for: .normal)
        expenseButton.backgroundColor = .systemGray6
        expenseButton.setTitleColor(.white, for: .selected)
        expenseButton.addTarget(self, action: #selector(tapExpenseButton), for: .touchUpInside)
        expenseButton.layer.cornerRadius = 8
        self.addSubview(expenseButton)
    }
    
    func setExpenseButtonConstrains() {
        expenseButton.translatesAutoresizingMaskIntoConstraints = false
        expenseButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        expenseButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        expenseButton.topAnchor.constraint(equalTo: self.summTextField.bottomAnchor, constant: 20).isActive = true
        expenseButton.trailingAnchor.constraint(equalTo: self.summTextField.trailingAnchor).isActive = true
    }
    
    @objc func tapIncomeButton() {
        if  !incomeButton.isSelected {
            incomeButton.isSelected = true
            incomeButton.backgroundColor = .systemBlue
            expenseButton.isSelected = false
            expenseButton.backgroundColor = .systemGray6
        }
    }
    

    @objc func tapExpenseButton() {
        if  !expenseButton.isSelected {
            expenseButton.isSelected = true
            expenseButton.backgroundColor = .systemBlue
            incomeButton.isSelected = false
            incomeButton.backgroundColor = .systemGray6
        }
        
    }
    
    @objc func tapAddButton() {
            addButton.backgroundColor = .systemGray6
            addButton.setTitleColor(.systemBlue, for: .selected)
            addButton.isSelected = true
            //dismiss(animated: true, completion: nil)
            
    }

    

    func configureCategoriesCollectionView(cv: UICollectionView) {
        cv.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        cv.delegate = self
        cv.dataSource = self
        cv.layer.cornerRadius = 8
        self.addSubview(cv)
        
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.widthAnchor.constraint(equalToConstant: 300).isActive = true
        cv.heightAnchor.constraint(equalToConstant: 200).isActive = true
        cv.topAnchor.constraint(equalTo: self.expenseButton.bottomAnchor, constant: 30).isActive = true
        cv.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    
    
    func configureAddButton() {
        addButton.setTitle("Add", for: .normal)
        addButton.setTitleColor(.white, for: .normal)
        addButton.backgroundColor = .systemBlue
        addButton.addTarget(self, action: #selector(tapAddButton), for: .touchUpInside)
        addButton.layer.cornerRadius = 8
        self.addSubview(addButton)
    }
    
    func setAddButtonConstrains() {
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        addButton.topAnchor.constraint(equalTo: self.categoriesCollectionView.bottomAnchor, constant: 20).isActive = true
        addButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .systemBackground
    
        configureHeader()
        setHeaderConstrains()
        
        configureLabel() 
        setLabelConstrains()
        
        
        configureTextField()
        setTextFieldConstrains()
        
        configureIncomeButton()
        setIncomeButtonConstrains()
        
        configureExpenseButton()
        setExpenseButtonConstrains()
    
        configureCategoriesCollectionView(cv: categoriesCollectionView)
        
        configureAddButton()
        setAddButtonConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}







extension AddTransactionView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}

extension AddTransactionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CategoryCollectionViewCell
        
        
        return cell
    }
    
    
}
