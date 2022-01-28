//
//  AddCategoryView.swift
//  Finance
//
//  Created by Vadim on 13.01.2022.
//

import UIKit

class AddCategoryView: UIView {
    
    var categoryStackView = UIStackView()
    var addCategoryButton = UIButton()
    weak var delegate: AddCategoryButtonDelegate?
    var nameTextField = UITextField()
    var symbolTextField = EmojiTextField()
    
    func configureNameTextField() {
        nameTextField.layer.cornerRadius = 8
        nameTextField.placeholder = "Название категории"
        nameTextField.clearButtonMode = .always
        nameTextField.leftViewMode = .always
        nameTextField.font = .systemFont(ofSize: 20)
        nameTextField.backgroundColor = .systemGray6
    }
    
    func configureSymbolTextField() {
        symbolTextField.placeholder = "Cимвол категории"
        symbolTextField.layer.cornerRadius = 8
        symbolTextField.clearButtonMode = .always
        symbolTextField.leftViewMode = .always
        symbolTextField.font = .systemFont(ofSize: 20)
        symbolTextField.backgroundColor = .systemGray6
    }
    
    func configureTapTextField() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIView.endEditing))
        self.addGestureRecognizer(tap)
    }
    
    func configureAddCategoryButton() {
        addCategoryButton.setTitle("Добавить", for: .normal)
        addCategoryButton.setTitleColor(.white, for: .normal)
        addCategoryButton.backgroundColor = .systemBlue
        addCategoryButton.setTitleColor(.gray, for: .highlighted)
        addCategoryButton.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        addCategoryButton.imageView?.tintColor = .white
        addCategoryButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        addCategoryButton.layer.cornerRadius = 8
        addCategoryButton.setConstraintsForSize(width: 160, height: 40)
        addCategoryButton.setCenterXAnchor(superView: self)
    }
    
    @objc func tapButton() {
        delegate?.tapButton(self)
    }
    

    func configureStackView() {
        categoryStackView.axis = .vertical
        categoryStackView.distribution = .fillEqually
        categoryStackView.spacing = 32
        categoryStackView.addArrangedSubview(nameTextField)
        categoryStackView.addArrangedSubview(symbolTextField)
        categoryStackView.addArrangedSubview(addCategoryButton)
        self.addSubview(categoryStackView)
        categoryStackView.setHorizontalConstraintsTo(superView: self, left: 8, right: 8)
        categoryStackView.setVerticalConstraintsTo(superView: self, top: 80, bottom: nil)
    }

    init() {
        super.init(frame: .zero)
        self.backgroundColor = .systemBackground
        self.setupHeaderTo(view: self, title: "Добавить категорию", popViewController: true)
        configureNameTextField()
        configureSymbolTextField()
        configureStackView()
        configureAddCategoryButton()
        configureTapTextField()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



