//
//  AddTransactionView.swift
//  Finance
//
//  Created by Vadim on 10.12.2021.
//

import Foundation
import UIKit

class AddTransactionView: UIView {

    var todaysDate = Date()
    var summLabel = UILabel()
    var appointmentLabel = UILabel()
    var dateLabel = UILabel()
    var noteLabel = UILabel()
    var summTextField = UITextField()
    var noteTextField = UITextField()
    var incomeButton = UIButton()
    var expenseButton = UIButton()
    var choiceCategoryButton = UIButton()
    var addButton = UIButton()
    weak var delegate: AddTransactionButtonDelegate?
    var stackView = UIStackView()
    var summStackView = UIStackView()
    var categoryStackView = UIStackView()
    var noteStackView = UIStackView()
    var typeButtonsStackView = UIStackView()
    var scrollView = UIScrollView()

    //MARK: configure ScrollView
    
    func configureScrollView() {
        scrollView.contentSize.height = 600
        self.addSubview(scrollView)
        scrollView.addSubview(stackView)
        scrollView.setHorizontalConstraintsTo(superView: self, left: 8, right: 8)
        scrollView.setVerticalConstraintsTo(superView: self, top: 0, bottom: 0)
    }
    
    //MARK: configure UIElements

    func configureSummLabel() {
        summLabel.text = "Сумма"
        summLabel.textAlignment = .left
        summLabel.font = UIFont.boldSystemFont(ofSize: 22)
        self.addSubview(summLabel)
    }
    
    func configureDateLabel() {
        let calendar = Calendar.current
        var date = Date()
        let dateComponentsFromCurrentDate = calendar.dateComponents([.year, .month, .day], from: date)
        date = calendar.date(from: dateComponentsFromCurrentDate) ?? Date()
        let dateString = date.dateToString()
        self.todaysDate = date
        dateLabel.text = "Дата: \(dateString)"
        dateLabel.textAlignment = .center
        dateLabel.font = UIFont.systemFont(ofSize: 18, weight: .light)
        self.addSubview(dateLabel)
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
        summTextField.font = UIFont.boldSystemFont(ofSize: 22)
        summTextField.keyboardType = .decimalPad
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
        noteTextField.font = .systemFont(ofSize: 20)
        addSubview(noteTextField)
    }
    
    func configureTapTextField() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIView.endEditing))
        self.addGestureRecognizer(tap)
    }
    
    func configureAddButton() {
        addButton.setTitle("Добавить", for: .normal)
        addButton.setTitleColor(.white, for: .normal)
        addButton.backgroundColor = .systemBlue
        addButton.setTitleColor(.gray, for: .highlighted)
        addButton.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        addButton.imageView?.tintColor = .white
        addButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        addButton.layer.cornerRadius = 8
        addButton.tag = 1
        self.addSubview(addButton)
        addButton.setConstraintsForSize(width: nil, height: 40)
    }
    
    //MARK: settings stackviews
    
    func configureStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 24
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(summStackView)
        stackView.addArrangedSubview(categoryStackView)
        stackView.addArrangedSubview(noteStackView)
        stackView.addArrangedSubview(addButton)
        stackView.setCenterXAnchor(superView: scrollView)
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 24).isActive = true
        stackView.setConstraintsForWidthFrom(view: scrollView)
    }
    
    func configureSummStackView() {
        summStackView.axis = .vertical
        summStackView.distribution = .fillEqually
        summStackView.spacing = 16
        summStackView.addArrangedSubview(summLabel)
        summStackView.addArrangedSubview(summTextField)
        summStackView.addArrangedSubview(typeButtonsStackView)
        summStackView.setConstraintsForSize(width: nil, height: 150)
    }
    
    func configureTypeButtonsStackView() {
        self.addSubview(typeButtonsStackView)
        typeButtonsStackView.axis = .horizontal
        typeButtonsStackView.distribution = .fillEqually
        typeButtonsStackView.spacing = 16
        typeButtonsStackView.addArrangedSubview(expenseButton)
        typeButtonsStackView.addArrangedSubview(incomeButton)
    }
    
    func configureCategoryStackView() {
        categoryStackView.axis = .vertical
        categoryStackView.distribution = .fillEqually
        categoryStackView.spacing = 16
        categoryStackView.addArrangedSubview(appointmentLabel)
        categoryStackView.addArrangedSubview(choiceCategoryButton)
        categoryStackView.setConstraintsForSize(width: nil, height: 100)
    }
    
    func configureNoteStackView() {
        noteStackView.axis = .vertical
        noteStackView.distribution = .fillEqually
        noteStackView.spacing = 16
        noteStackView.addArrangedSubview(noteLabel)
        noteStackView.addArrangedSubview(noteTextField)
        noteStackView.setConstraintsForSize(width: nil, height: 100)
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
        self.setupHeaderTo(view: self, title: "Добавить операцию", popViewController: true)
        
        configureDateLabel()
        configureScrollView()
        configureSummLabel()
        configureSummTextField()
        configureIncomeButton()
        configureExpenseButton()
        configureAppointmentLabel()
        configureChoiceCategoryButton()
        configureNoteLabel()
        configureNoteTextField()
        configureAddButton()
        configureTypeButtonsStackView()
        configureSummStackView()
        configureCategoryStackView()
        configureNoteStackView()
        configureStackView()
        configureTapTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



