//
//  Cards.swift
//  TestTask
//
//  Created by Arsen on 9/12/19.
//  Copyright © 2019 Arsen. All rights reserved.
//

import UIKit
import Foundation

class Card1: UIView {
    
    override func draw(_ rect: CGRect) {
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 110, height: 150), cornerRadius: 15).cgPath
        layer.strokeColor = UIColor.white.cgColor
        layer.strokeStart = 0
        layer.fillColor = .none
        layer.lineWidth = 4
        layer.lineDashPattern = [4,4]
        self.layer.addSublayer(layer)
    }
}

class Card2: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let grid = GridView(frame: CGRect(x: self.bounds.minX, y: self.bounds.minY, width: self.frame.width, height: self.frame.height + 47))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 110, height: 150), cornerRadius: 15).cgPath
        shapeLayer.fillColor = .none
        shapeLayer.frame = CGRect(x: 0, y: 0, width: 110, height: 150)
        shapeLayer.borderWidth = 10
        shapeLayer.cornerRadius = 15
        shapeLayer.borderColor = UIColor.white.cgColor
        
        self.addSubview(grid)
        self.layer.addSublayer(shapeLayer)
        
    }
    
}

class Card3: UIView {
    
    let addLayer = CAShapeLayer()
    
    
    override func draw(_ rect: CGRect) {
        
        let oval = CustomOval(frame: CGRect(x: self.bounds.midX, y: 30, width: 40, height: 10))
        let one = CustomOne(frame: CGRect(x: 40, y: 30, width: 10, height: 30))
        let square = CustomSquare(frame: CGRect(x: self.bounds.midX - 5, y: 105, width: 40, height: 10))
        
        
        
        let shapeLayer = CAShapeLayer()
        
        let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 110, height: 150), cornerRadius: 15)
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.white.cgColor
        
        square.rotate(angle: 45)
        self.addSubview(oval)
        self.addSubview(one)
        self.addSubview(square)
        
        shapeLayer.addSublayer(square.layer)
        shapeLayer.addSublayer(one.layer)
        shapeLayer.addSublayer(oval.layer)
        self.layer.addSublayer(shapeLayer)
    }
    
}



