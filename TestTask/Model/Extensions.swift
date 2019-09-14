//
//  Extensions.swift
//  TestTask
//
//  Created by Arsen on 9/14/19.
//  Copyright © 2019 Arsen. All rights reserved.
//
import UIKit
import Foundation

extension UIView {
    
    func rotate(angle: CGFloat) {
        let radians = angle / 180.0 * CGFloat.pi
        let rotation = self.transform.rotated(by: radians)
        self.transform = rotation
    }
    
}

extension CGFloat {
    func toRadians() -> CGFloat {
        return self * CGFloat(Double.pi / 180.0)
    }
}


extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
