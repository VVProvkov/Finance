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
    var dateLabel = UILabel()
    var noteLabel = UILabel()
    var header = UIView()
    var summTextField = UITextField()
    var noteTextField = UITextField()
    var incomeButton = UIButton()
    var expenseButton = UIButton()
    var choiceCategoryButton = UIButton()
    var addButton = UIButton()
    weak var delegate: ButtonDelegate?
    var stackView = UIStackView()

    //MARK: configure UIElements
    
    func configureStackView() {
        self.addSubview(stackView)
    }
    
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        //stackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        stackView.topAnchor.constraint(equalTo: self.header.bottomAnchor, constant: 32).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        stackView
    }
    
    
    
    
    func configureHeader() {
        header.backgroundColor = .secondarySystemBackground
        self.addSubview(header)
    }
    
    func configureHeaderLabel() {
        headerLabel.text = "Добавить операцию"
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
    
    func configureNoteLabel() {
        noteLabel.text = "Заметка"
        noteLabel.textAlignment = .left
        noteLabel.font = UIFont.boldSystemFont(ofSize: 22)
        self.addSubview(noteLabel)
    }
    
    func configureImage(type: String) -> UIImageView {
        let imageView = UIImageView(image: UIImage(systemName: type))
        imageView.preferredSymbolConfiguration = UIImage.SymbolConfiguration(weight: .bold)
        imageView.tintColor = .systemGray3
        return imageView
    }
    
    func configureSummTextField() {
        summTextField.placeholder = "100 ₽"
        summTextField.backgroundColor = UIColor.systemGray6
        summTextField.layer.cornerRadius = 8
        summTextField.clearButtonMode = .always
        summTextField.leftViewMode = .always
        summTextField.leftView = configureImage(type: "minus")
        summTextField.font = .systemFont(ofSize: 20)
        summTextField.keyboardType = .decimalPad
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIView.endEditing))
        self.addGestureRecognizer(tap)
        addSubview(summTextField)
    }

    func configureIncomeButton() {
        incomeButton.setTitle("Доход", for: .normal)
        incomeButton.setTitleColor(.systemBlue, for: .normal)
        incomeButton.backgroundColor = .systemGray6
        incomeButton.setTitleColor(.white, for: .selected)
        incomeButton.addTarget(self, action: #selector(tapIncomeButton), for: .touchUpInside)
        incomeButton.layer.cornerRadius = 8
        self.addSubview(incomeButton)
    }
    
    func configureExpenseButton() {
        expenseButton.setTitle("Расход", for: .normal)
        expenseButton.setTitleColor(.systemBlue, for: .normal)
        expenseButton.backgroundColor = .systemBlue
        expenseButton.isSelected = true
        expenseButton.setTitleColor(.white, for: .selected)
        expenseButton.addTarget(self, action: #selector(tapExpenseButton), for: .touchUpInside)
        expenseButton.layer.cornerRadius = 8
        self.addSubview(expenseButton)
    }
    
    func configureChoiceCategoryButton() {
        choiceCategoryButton.setTitle("Выбрать категорию", for: .normal)
        choiceCategoryButton.setTitleColor(.systemBlue, for: .normal)
        choiceCategoryButton.backgroundColor = .systemGroupedBackground
        choiceCategoryButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        choiceCategoryButton.layer.cornerRadius = 8
        choiceCategoryButton.tag = 0
        self.addSubview(choiceCategoryButton)
    }
    func configureNoteTextField() {
        noteTextField.placeholder = "  Введите описание"
        noteTextField.backgroundColor = UIColor.systemGray6
        noteTextField.layer.cornerRadius = 8
        noteTextField.clearButtonMode = .always
        noteTextField.leftViewMode = .always
        //noteTextField.leftView = configureImage(type: "minus")
        noteTextField.font = .systemFont(ofSize: 20)
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIView.endEditing))
        self.addGestureRecognizer(tap)
        addSubview(noteTextField)
    }
    
    func configureAddButton() {
        addButton.setTitle("Добавить", for: .normal)
        addButton.setTitleColor(.white, for: .normal)
        addButton.backgroundColor = .systemBlue
        addButton.setTitleColor(.white, for: .selected)
        addButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        addButton.layer.cornerRadius = 8
        addButton.tag = 1
        self.addSubview(addButton)
    }
    
    //MARK: settings constraints

    func setHeaderConstraints() {
        header.setConstraintsForSizeTo(width: nil, height: 60)
        header.setHorizontalConstraintsTo(superView: self, left: 0, right: 0)
        header.setVerticalConstraintsTo(superView: self, top: 0, bottom: nil)
    }
    
    func setHeaderLabelConstraints() {
        headerLabel.setConstraintsForSizeTo(width: 200, height: 50)
        headerLabel.centerYAnchor.constraint(equalTo: self.header.centerYAnchor).isActive = true
        headerLabel.centerXAnchor.constraint(equalTo: self.header.centerXAnchor).isActive = true
    }
    
    func setSummLabelConstraints() {
        summLabel.setConstraintsForSizeTo(width: summLabel.intrinsicContentSize.width, height: summLabel.intrinsicContentSize.height)
        summLabel.setHorizontalConstraintsTo(superView: self, left: 16, right: nil)
        summLabel.topAnchor.constraint(equalTo: self.header.bottomAnchor, constant: 32).isActive = true
    }
    
    func setSummFieldConstraints() {
        summTextField.setConstraintsForSizeTo(width: nil, height: 50)
        summTextField.setHorizontalConstraintsTo(superView: self, left: 16, right: 16)
        summTextField.topAnchor.constraint(equalTo: self.summLabel.bottomAnchor, constant: 16).isActive = true
    }
    
    func setAppointmentLabelConstraints() {
        summTextField.setConstraintsForSizeTo(width: appointmentLabel.intrinsicContentSize.width, height: appointmentLabel.intrinsicContentSize.height)
        summTextField.setHorizontalConstraintsTo(superView: self, left: 16, right: nil)
        summTextField.topAnchor.constraint(equalTo: self.expenseButton.bottomAnchor, constant: 32).isActive = true
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
    
    func setChoiceCategoryButtonConstraints() {
        choiceCategoryButton.translatesAutoresizingMaskIntoConstraints = false
        choiceCategoryButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        choiceCategoryButton.topAnchor.constraint(equalTo: appointmentLabel.bottomAnchor, constant: 16).isActive = true
        choiceCategoryButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        choiceCategoryButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
    }
    
    func setNoteLabelConstraints() {
        noteLabel.translatesAutoresizingMaskIntoConstraints = false
        noteLabel.widthAnchor.constraint(equalToConstant: noteLabel.intrinsicContentSize.width).isActive = true
        noteLabel.heightAnchor.constraint(equalToConstant: noteLabel.intrinsicContentSize.height).isActive = true
        noteLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        noteLabel.topAnchor.constraint(equalTo: self.choiceCategoryButton.bottomAnchor, constant: 32).isActive = true
    }
    
    func setNoteTextFieldConstraints() {
        noteTextField.setConstraintsForSizeTo(width: nil, height: 50)
        noteTextField.setHorizontalConstraintsTo(superView: self, left: 16, right: 16)
        noteTextField.topAnchor.constraint(equalTo: self.noteLabel.bottomAnchor, constant: 16).isActive = true
    }
    
    func setAddButtonConstraints() {
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 180).isActive = true
        addButton.topAnchor.constraint(equalTo: noteTextField.bottomAnchor, constant: 32).isActive = true
        addButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    //MARK: ButtonsFunctions
    
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
    
 
    @objc func tapButton(sender: UIButton) {
        delegate?.tapButton(self, sender: sender)
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
        
        configureSummTextField()
        setSummFieldConstraints()
        
        configureIncomeButton()
        setIncomeButtonConstraints()
        
        configureExpenseButton()
        setExpenseButtonConstraints()
    
        configureAppointmentLabel()
        setAppointmentLabelConstraints()
        
        configureChoiceCategoryButton()
        setChoiceCategoryButtonConstraints()
        
        configureNoteLabel()
        setNoteLabelConstraints()
        
        configureNoteTextField()
        setNoteTextFieldConstraints()
        
        configureAddButton()
        setAddButtonConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



