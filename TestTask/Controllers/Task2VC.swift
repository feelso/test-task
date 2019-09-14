//
//  Task2VC.swift
//  TestTask
//
//  Created by Arsen on 9/12/19.
//  Copyright © 2019 Arsen. All rights reserved.
//

import UIKit

class Task2VC: UIViewController {
    
    var isFlipped = true
    
    let myView = UIView()
    
    let card1 = Card1(frame: CGRect(x: 80, y: 130, width: 100, height: 100))
    let card2 = Card2(frame: CGRect(x: 130, y: 320, width: 100, height: 100))
    let card3 = Card3(frame: CGRect(x: 210, y: 130, width: 100, height: 100))
    let flipCard = Card3(frame: CGRect(x: 130, y: 320, width: 100, height: 100))

    override func viewDidLoad() {
        super.viewDidLoad()
            setupViews()
        
    }
    
    
    @objc func flip() {
        
        if isFlipped {
            UIView.transition(from: card2,
                              to: flipCard,
                              duration: 0.4,
                              options: [.transitionFlipFromRight, .showHideTransitionViews]) { (Bool) in
                                self.isFlipped = !self.isFlipped
            }
        } else {
            UIView.transition(from: flipCard,
                              to: card2,
                              duration: 0.4,
                              options: [.transitionFlipFromLeft, .showHideTransitionViews]) { (Bool) in
                                self.isFlipped = !self.isFlipped
            }
        }
    }

    func setupViews() {
        
        let button: UIButton = {
            let btn = UIButton()
            btn.frame = CGRect(x: view.frame.width / 2 - 30, y: 520, width: 60, height: 40)
            let color: UIColor = #colorLiteral(red: 0.2207842469, green: 0.6311809421, blue: 0.9513030648, alpha: 1)
            btn.backgroundColor = color
            btn.layer.cornerRadius = 10
            btn.setTitle("Flip", for: .normal)
            return btn
        }()
        button.addTarget(self, action: #selector(flip), for: .touchUpInside)
        
        myView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)

        view.addSubview(myView)
        view.addSubview(card1)
        view.addSubview(card3)
        myView.addSubview(flipCard)
        myView.addSubview(card2)
        view.addSubview(button)
        
    }
}




