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

class GridView: UIView {
    
    private var path = UIBezierPath()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.drawGridd()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    fileprivate func drawGridd() {
        
        path = UIBezierPath()
        path.lineWidth = 0.5
        
        var counter: CGFloat = 15
        
        for _ in 1...5 {
            
            let start = CGPoint(x: self.bounds.minX, y: counter)
            let end = CGPoint(x: counter, y: self.bounds.minY)
            path.move(to: start)
            path.addLine(to: end)
            counter += 20
        }
        var counter2: CGFloat = bounds.minY + 8
        path.move(to: CGPoint(x: counter - 8, y: counter2))
        path.addLine(to: CGPoint(x: bounds.minX, y: counter))
        
        counter2 += 20
        counter += 20
        
        for _ in 1...2 {
            let start = CGPoint(x: self.bounds.maxX + 8, y: counter2)
            let end = CGPoint(x: bounds.minX + 7, y: counter - 7)
            path.move(to: start)
            path.addLine(to: end)
            counter += 20
            counter2 += 20
        }
        counter2 += 10
        var counter3: CGFloat = 27
        
        for _ in 1...4 {
            let start = CGPoint(x: counter3, y: bounds.maxY)
            let end = CGPoint(x: bounds.maxX + 7, y: counter2 - 7)
            path.move(to: end)
            path.addLine(to: start)
            counter2 += 20
            counter3 += 20
        }
        
        var reverseCounter: CGFloat = 15
        for _ in 1...5 {
            let start = CGPoint(x: self.bounds.width - reverseCounter , y: self.bounds.minY + 4)
            let end = CGPoint(x: self.bounds.width + 5 , y: self.bounds.minY + reverseCounter + 5)
            path.move(to: start)
            path.addLine(to: end)
            reverseCounter += 20
        }
        var revCounter2: CGFloat = 20
        path.move(to: CGPoint(x: bounds.minX, y: revCounter2))
        path.addLine(to: CGPoint(x: self.bounds.width + 5, y: reverseCounter + 5))
        
        revCounter2 += 20
        reverseCounter += 20
        
        let start = CGPoint(x: bounds.minX , y: revCounter2 + 2)
        let end = CGPoint(x: self.bounds.width + 5 , y: reverseCounter + 5)
        path.move(to: start)
        path.addLine(to: end)
        reverseCounter += 20
        revCounter2 += 20
        
        var revCounter3: CGFloat = 10
        for _ in 1...4 {
            
            let start = CGPoint(x: bounds.minX , y: revCounter2 + 2)
            let end = CGPoint(x: self.bounds.width - revCounter3 , y: bounds.height)
            path.move(to: start)
            path.addLine(to: end)
            revCounter3 += 20
            revCounter2 += 20
            
        }
        
        path.close()
        
    }
    
    override func draw(_ rect: CGRect) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.frame = CGRect(x: 0, y: 0, width: 110, height: 150)
        shapeLayer.lineWidth = 0.5
        shapeLayer.fillColor = .none
        shapeLayer.backgroundColor = UIColor.lightGray.cgColor
        shapeLayer.cornerRadius = 15
        shapeLayer.strokeColor = UIColor.white.cgColor
        self.layer.addSublayer(shapeLayer)
    }
}

