//
//  AddCategpryViewController.swift
//  Finance
//
//  Created by Vadim on 13.01.2022.
//

import UIKit

class AddCategoryViewController: UIViewController {

    var category: Category?
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
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        self.view.addGestureRecognizer(tap)
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
        addCategoryButton.setCenterXAnchor(superView: self.view)
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "", message: "Заполнены не все поля", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func tapButton() {
        guard nameTextField.text != "", symbolTextField.text != "" else { return showAlert() }
        delegate?.tapButton(self)
        self.dismiss(animated: true)
    }
    

    func configureStackView() {
        categoryStackView.axis = .vertical
        categoryStackView.distribution = .fillEqually
        categoryStackView.spacing = 32
        categoryStackView.addArrangedSubview(nameTextField)
        categoryStackView.addArrangedSubview(symbolTextField)
        categoryStackView.addArrangedSubview(addCategoryButton)
        self.view.addSubview(categoryStackView)
        categoryStackView.setHorizontalConstraintsTo(superView: self.view, left: 8, right: 8)
        categoryStackView.setVerticalConstraintsTo(superView: self.view, top: 80, bottom: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.setupHeaderTo(view: self.view, title: "Добавить категорию", popViewController: true)
        self.view.backgroundColor = .systemBackground
        configureNameTextField()
        configureSymbolTextField()
        configureStackView()
        configureAddCategoryButton()
        configureTapTextField()
    }


    
}
