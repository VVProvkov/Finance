//
//  AddTransactionView.swift
//  Finance
//
//  Created by Vadim on 10.12.2021.
//

import Foundation
import UIKit

class AddTransactionView: UIView {
    

    var headerLabel = UILabel()
    var summLabel = UILabel()
    var appointmentLabel = UILabel()
    var additionallyLabel = UILabel()
    var dateLabel = UILabel()
    
    var header = UIView()
    var summTextField = UITextField()
    var incomeButton = UIButton()
    let expenseButton = UIButton()
    var addButton = UIButton()
    weak var delegate: AddButtonDelegate?
    let categoriesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 70, height: 70)
        let categoriesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return categoriesCollectionView
    }()
    
    //MARK: configure UIElements
    
    func configureHeader() {
        header.backgroundColor = .secondarySystemBackground
        self.addSubview(header)
    }
    
    func configureHeaderLabel() {
        headerLabel.text = "Add transaction"
        headerLabel.textAlignment = .center
        self.header.addSubview(headerLabel)
    }
    
    func configureSummLabel() {
        summLabel.text = "Сумма"
        summLabel.textAlignment = .left
        summLabel.font = UIFont.boldSystemFont(ofSize: 22)
        self.addSubview(summLabel)
    }
    
    func configureAppointmentLabel() {
        appointmentLabel.text = "Назначение"
        appointmentLabel.textAlignment = .left
        appointmentLabel.font = UIFont.boldSystemFont(ofSize: 22)
        self.addSubview(appointmentLabel)
    }
    
    func configureAdditionallyLabel() {
        additionallyLabel.text = "Дополнительно"
        additionallyLabel.textAlignment = .left
        self.addSubview(additionallyLabel)
    }
    
    func configureImage(type: String) -> UIImageView {
        let imageView = UIImageView(image: UIImage(systemName: type))
        imageView.preferredSymbolConfiguration = UIImage.SymbolConfiguration(weight: .bold)
        imageView.tintColor = .systemGray3
        return imageView
    }
    
    func configureTextField() {
        summTextField.placeholder = "100 ₽"
        summTextField.backgroundColor = UIColor.systemGray6
        summTextField.layer.cornerRadius = 8
        summTextField.clearButtonMode = .always
        summTextField.leftViewMode = .always
        
        summTextField.leftView = configureImage(type: "minus")
        summTextField.font = .systemFont(ofSize: 24)
        summTextField.keyboardType = .decimalPad
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIView.endEditing))
        self.addGestureRecognizer(tap)
        
        addSubview(summTextField)
    }

    func configureIncomeButton() {
        incomeButton.setTitle("Income", for: .normal)
        incomeButton.setTitleColor(.systemBlue, for: .normal)
        incomeButton.backgroundColor = .systemGray6
        incomeButton.setTitleColor(.white, for: .selected)
        incomeButton.addTarget(self, action: #selector(tapIncomeButton), for: .touchUpInside)
        incomeButton.layer.cornerRadius = 8
        self.addSubview(incomeButton)
    }
    
    func configureExpenseButton() {
        expenseButton.setTitle("Expense", for: .normal)
        expenseButton.setTitleColor(.systemBlue, for: .normal)
        expenseButton.backgroundColor = .systemBlue
        expenseButton.isSelected = true
        expenseButton.setTitleColor(.white, for: .selected)
        expenseButton.addTarget(self, action: #selector(tapExpenseButton), for: .touchUpInside)
        expenseButton.layer.cornerRadius = 8
        self.addSubview(expenseButton)
    }
    
    func configureCategoriesCollectionView() {
        categoriesCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
       
        categoriesCollectionView.layer.cornerRadius = 8
        self.addSubview(categoriesCollectionView)
    }
    
    func configureAddButton() {
        addButton.setTitle("Add", for: .normal)
        addButton.setTitleColor(.white, for: .normal)
        addButton.backgroundColor = .systemBlue
        addButton.setTitleColor(.white, for: .selected)
        addButton.addTarget(self, action: #selector(tapAddButton), for: .touchUpInside)
        addButton.layer.cornerRadius = 8
        self.addSubview(addButton)
    }
    

    //MARK: settings constraints

    func setHeaderConstraints() {
        header.translatesAutoresizingMaskIntoConstraints = false
        header.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        header.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        header.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        header.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func setHeaderLabelConstraints() {
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        headerLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        headerLabel.centerYAnchor.constraint(equalTo: self.header.centerYAnchor).isActive = true
        headerLabel.centerXAnchor.constraint(equalTo: self.header.centerXAnchor).isActive = true
    }
    
    func setSummLabelConstraints() {
        summLabel.translatesAutoresizingMaskIntoConstraints = false
        summLabel.widthAnchor.constraint(equalToConstant: summLabel.intrinsicContentSize.width).isActive = true
        summLabel.heightAnchor.constraint(equalToConstant: summLabel.intrinsicContentSize.height).isActive = true
        summLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        summLabel.topAnchor.constraint(equalTo: self.header.bottomAnchor, constant: 40).isActive = true
    }
    
    func setTextFieldConstraints() {
        summTextField.translatesAutoresizingMaskIntoConstraints = false
        summTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        summTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        summTextField.topAnchor.constraint(equalTo: self.summLabel.bottomAnchor, constant: 16).isActive = true
        summTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        summTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
    }
    
    func setAppointmentLabelConstraints() {
        appointmentLabel.translatesAutoresizingMaskIntoConstraints = false
        appointmentLabel.widthAnchor.constraint(equalToConstant: appointmentLabel.intrinsicContentSize.width).isActive = true
        appointmentLabel.heightAnchor.constraint(equalToConstant: appointmentLabel.intrinsicContentSize.height).isActive = true
        appointmentLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        appointmentLabel.topAnchor.constraint(equalTo: self.expenseButton.bottomAnchor, constant: 32).isActive = true
    }
    
    
    func setExpenseButtonConstraints() {
        expenseButton.translatesAutoresizingMaskIntoConstraints = false
        expenseButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        expenseButton.topAnchor.constraint(equalTo: self.summTextField.bottomAnchor, constant: 16).isActive = true
        expenseButton.leadingAnchor.constraint(equalTo: incomeButton.trailingAnchor, constant: 16).isActive = true
        expenseButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
    }
    
    func setIncomeButtonConstraints() {
        incomeButton.translatesAutoresizingMaskIntoConstraints = false
        incomeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        incomeButton.widthAnchor.constraint(equalToConstant: 180).isActive = true
        incomeButton.topAnchor.constraint(equalTo: self.summTextField.bottomAnchor, constant: 16).isActive = true
        incomeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
    }
    
    func setCCollectionViewConstraints() {
        categoriesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        categoriesCollectionView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        categoriesCollectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        categoriesCollectionView.topAnchor.constraint(equalTo: self.appointmentLabel.bottomAnchor, constant: 16).isActive = true
        categoriesCollectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    func setAddButtonConstraints() {
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 180).isActive = true
        addButton.topAnchor.constraint(equalTo: categoriesCollectionView.bottomAnchor, constant: 16).isActive = true
        addButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    @objc func tapIncomeButton() {
        if  !incomeButton.isSelected {
            incomeButton.isSelected = true
            incomeButton.backgroundColor = .systemBlue
            expenseButton.isSelected = false
            expenseButton.backgroundColor = .systemGray6
            self.summTextField.leftView = configureImage(type: "plus")
        }
    }

    @objc func tapExpenseButton() {
        if  !expenseButton.isSelected {
            expenseButton.isSelected = true
            expenseButton.backgroundColor = .systemBlue
            incomeButton.isSelected = false
            incomeButton.backgroundColor = .systemGray6
            self.summTextField.leftView = configureImage(type: "minus")
        }
        
    }
    
 
    @objc func tapAddButton() {
        delegate?.tapAddButton(self)
    }
    
    
    //MARK: initializing
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .systemBackground
    
        configureHeader()
        setHeaderConstraints()
        
        configureHeaderLabel()
        setHeaderLabelConstraints()
        
        configureSummLabel()
        setSummLabelConstraints()
        
        configureTextField()
        setTextFieldConstraints()
        
        configureIncomeButton()
        setIncomeButtonConstraints()
        
        configureExpenseButton()
        setExpenseButtonConstraints()
    
        configureAppointmentLabel()
        setAppointmentLabelConstraints()
        
        configureCategoriesCollectionView()
        setCCollectionViewConstraints()
        
        configureAddButton()
        setAddButtonConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}




