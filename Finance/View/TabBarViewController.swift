//
//  TabBarVC.swift
//  Phin2
//
//  Created by Vadim on 27.11.2021.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    
    var middleButton = UIButton()
    private var shapeLayer: CALayer?
    private var circleLayer: CALayer?
    private var tabBarWidth: CGFloat { self.tabBar.bounds.width }
    private var tabBarHeight: CGFloat { self.tabBar.bounds.height }
    private var centerWidth: CGFloat { self.tabBar.bounds.width / 2 }
    private let circleRadius: CGFloat = 25

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
        self.present(addTransactionNVC, animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        middleButton.frame = CGRect(x: self.view.bounds.width/2 - 23, y: self.view.bounds.height - self.view.safeAreaInsets.bottom - 60, width: 46, height: 46)
        drawTabBar()
    }

}


extension TabBarViewController {
    
    private func shapePath() -> CGPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: tabBarWidth, y: 0))
        path.close()
        return path.cgPath
    }
    
    private func circlePath() -> CGPath {
        let path = UIBezierPath() // 1
        path.addArc(withCenter: CGPoint(x: centerWidth, y: 10), // 2
                    radius: circleRadius, // 3
                    startAngle: 180 * .pi / 180, // 4
                    endAngle: 0 * 180 / .pi, // 5
                    clockwise: true) // 6
        return path.cgPath // 7
    }
    
    private func drawTabBar() {
       
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shapePath()
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 0.5

 
        let circleLayer = CAShapeLayer()
        circleLayer.path = circlePath()
        circleLayer.strokeColor = UIColor.lightGray.cgColor
        circleLayer.fillColor = UIColor.white.cgColor
        circleLayer.lineWidth = 0.5

        if let oldShapeLayer = self.shapeLayer {
            self.tabBar.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.tabBar.layer.insertSublayer(shapeLayer, at: 0)
        }

        if let oldCircleLayer = self.circleLayer {
            self.tabBar.layer.replaceSublayer(oldCircleLayer, with: circleLayer)
        } else {
            self.tabBar.layer.insertSublayer(circleLayer, at: 1)
        }

        self.shapeLayer = shapeLayer
        self.circleLayer = circleLayer
    }

}
