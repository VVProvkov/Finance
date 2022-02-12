//
//  TableViewController.swift
//  Finance
//
//  Created by Vadim on 18.12.2021.
//

import UIKit

class CategoriesTableViewController: UITableViewController, AddCategoryButtonDelegate {

    var categories = [Category]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    let coreDataManager = CoreDataManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(CategoriesTableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.register(AddCategoryTableViewCell.self, forCellReuseIdentifier: "addCategoryCell")
        self.tableView.backgroundColor = .systemBackground
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        coreDataManager.getAllCategories { [unowned self] categories in
            self.categories = categories
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        coreDataManager.save(categories: self.categories)
    }
    
    
    func tapButton(_ view: AddCategoryViewController) {
        guard let nameCategory = view.nameTextField.text else { return }
        guard let symbolCategory = view.symbolTextField.text else { return }
        let category = Category(name: nameCategory, emoji: symbolCategory)
        categories.append(category)
    }
}
