//
//  TabBarVC.swift
//  Phin2
//
//  Created by Vadim on 27.11.2021.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    
    var middleButton = UIButton()
    var shapeLayer: CALayer?
    var circleLayer: CALayer?
    var tabBarWidth: CGFloat { self.tabBar.bounds.width }
    var tabBarHeight: CGFloat { self.tabBar.bounds.height }
    var centerWidth: CGFloat { self.tabBar.bounds.width / 2 }
    let circleRadius: CGFloat = 25

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMiddleButton()
    }

    //MARK: create middle button
    
    func setupMiddleButton() {
        middleButton.setBackgroundImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        middleButton.addTarget(self, action: #selector(menuButtonAction), for: .touchUpInside)
        middleButton.tintColor = .gray
        self.view.addSubview(middleButton)
    }
    @objc func menuButtonAction(sender: UIButton) {
        let addTransactionVC = AddTransactionViewController()
        let addTransactionNVC = UINavigationController(rootViewController: addTransactionVC)
        guard let transactionsVC = self.viewControllers?[0] as? TransactionsViewController else { return }
        addTransactionVC.delegate = transactionsVC
        self.present(addTransactionNVC, animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        middleButton.frame = CGRect(x: self.view.bounds.width/2 - 23, y: self.view.bounds.height - self.view.safeAreaInsets.bottom - 60, width: 46, height: 46)
        drawTabBar()
    }

}



