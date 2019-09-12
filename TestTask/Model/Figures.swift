//
//  Figures.swift
//  TestTask
//
//  Created by Arsen on 9/12/19.
//  Copyright © 2019 Arsen. All rights reserved.
//
import UIKit
import Foundation

private  let red: UIColor = #colorLiteral(red: 0.9357051253, green: 0.3955019414, blue: 0.4037353992, alpha: 1)

class CustomSquare: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let squarePath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 20, height: 20), cornerRadius: 0)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = squarePath.cgPath
        shapeLayer.fillColor = red.cgColor
        shapeLayer.strokeColor = red.cgColor
        shapeLayer.lineWidth = 2
        
        self.layer.addSublayer(shapeLayer)
    }
    
}


class CustomOne: UIView {
    
    override func draw(_ rect: CGRect) {
        let pathForOne = UIBezierPath()
        pathForOne.move(to: CGPoint(x: 0, y: 0))
        pathForOne.addLine(to: CGPoint(x: 0, y: 40))
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = pathForOne.cgPath
        shapeLayer.fillColor = .none
        shapeLayer.strokeColor = red.cgColor
        shapeLayer.lineWidth = 2
        
        self.layer.addSublayer(shapeLayer)
    }
    
}

class CustomOval: UIView {
    
    override func draw(_ rect: CGRect) {
        let ellipsePath = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 30, height: 40))
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = ellipsePath.cgPath
        shapeLayer.fillColor = .none
        shapeLayer.strokeColor = red.cgColor
        shapeLayer.lineWidth = 2
        
        self.layer.addSublayer(shapeLayer)
    }
}
