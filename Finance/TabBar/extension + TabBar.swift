//
//  extension + TabBar.swift
//  Finance
//
//  Created by Vadim on 09.02.2022.
//

import Foundation
import UIKit

extension TabBarViewController {
    
    func shapePath() -> CGPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: tabBarWidth, y: 0))
        path.close()
        return path.cgPath
    }
    
    func circlePath() -> CGPath {
        let path = UIBezierPath() // 1
        path.addArc(withCenter: CGPoint(x: centerWidth, y: 10), // 2
                    radius: circleRadius, // 3
                    startAngle: 180 * .pi / 180, // 4
                    endAngle: 0 * 180 / .pi, // 5
                    clockwise: true) // 6
        return path.cgPath // 7
    }
    
    func drawTabBar() {
       
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
