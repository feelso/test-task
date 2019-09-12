//
//  Task2VC.swift
//  TestTask
//
//  Created by Arsen on 9/12/19.
//  Copyright © 2019 Arsen. All rights reserved.
//

import UIKit

class Task2VC: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
       
        let card1 = Card1(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        let card3 = Card3(frame: CGRect(x: 100, y: 260, width: 100, height: 100))
        
        view.addSubview(card3)
        view.addSubview(card1)
        
    }
    

    func secondCard() {
        
        let layer = CAShapeLayer()
        
        layer.strokeColor = UIColor.white.cgColor
        layer.fillColor = .none
        layer.frame = CGRect(x: 150, y: 250, width: 110, height: 150)
        layer.borderWidth = 7
        layer.cornerRadius = 15
        layer.borderColor = UIColor.white.cgColor
       
        view.layer.addSublayer(layer)
        
    }
    
    
    func firstCard() {
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(roundedRect: CGRect(x: 15, y: 50, width: 110, height: 150), cornerRadius: 15).cgPath
        layer.strokeColor = UIColor.white.cgColor
        layer.fillColor = .none
        layer.lineWidth = 4
        layer.lineDashPattern = [5,5]
        view.layer.addSublayer(layer)
    }

}




