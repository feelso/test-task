//
//  ViewController.swift
//  TestTask
//
//  Created by Arsen on 9/10/19.
//  Copyright © 2019 Arsen. All rights reserved.
//

import UIKit

class Task1VC: UIViewController {
    let width: CGFloat = 160
    let height: CGFloat = 160.0
    var path = UIBezierPath()

   
    let viewImage = UIImageView()
    let textLabel = UILabel()
    let buttonAction = UIButton()
    let textField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        textField.addTarget(self, action: #selector(textFieldChanged), for: .allEditingEvents)

        setupViews()

    }

    func setupViews() {
        textField.delegate = self

        if let url = URL(string: "https://images.dog.ceo/breeds/pomeranian/n02112018_5482.jpg"), let imgData = try? Data(contentsOf: url) {
            let image = UIImage(data: imgData)
            
            viewImage.image = image
            viewImage.frame = CGRect(x: 0 , y: 0, width: 160, height: 160)
            viewImage.center = CGPoint(x: view.center.x, y: view.center.y - 100)
            halfCircleMaskFor(imageView: viewImage)
            addMaskPathFor(image: viewImage)
        }
        textLabel.text = "5"
        textLabel.font = UIFont.systemFont(ofSize: 30)
        textLabel.frame = CGRect(x: 0, y: 0, width: 25, height: 50)
        textLabel.center = CGPoint(x: view.center.x + width / 3 , y: view.center.y - 100)
        
        textField.frame = CGRect(x: view.center.x - 50, y: view.center.y, width: 100, height: 30)
        textField.borderStyle = .roundedRect
        textField.placeholder = "Number"
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        
        self.view.addSubview(textField)
        self.view.addSubview(buttonAction)
        self.view.addSubview(viewImage)
        self.view.addSubview(textLabel)
    }
    func addMaskPathFor(image: UIImageView)  {
        let layer = CAShapeLayer()
        layer.path  = path.cgPath
        image.layer.mask = layer
    }
    
    func halfCircleMaskFor(imageView: UIImageView) {
        path = UIBezierPath()
        
        path.addArc(withCenter: CGPoint(x: imageView.frame.width / 2  , y: imageView.frame.height / 2),
                                                    radius: 52,
                                      startAngle: CGFloat(25.0).toRadians(),
                                      endAngle: CGFloat(-25.0).toRadians(),
                                      clockwise: true)
    
        path.addCurve(to: CGPoint(x: 115, y: 80), controlPoint1: CGPoint(x: 118, y: 68), controlPoint2: CGPoint(x: 115, y: 73))
        path.addCurve(to: CGPoint(x: 121, y: 95), controlPoint1: CGPoint(x: 115, y: 86), controlPoint2: CGPoint(x: 117, y: 90))

        path.close()
     
    }

}

extension Task1VC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc private func textFieldChanged() {
        
        if  textField.text?.isEmpty == false {
            let response = Validation.shared.validate(values: (ValidationType.number, textField.text!))
            
            switch response {
            case .success:
                textField.textColor = .black
                textLabel.text = textField.text

            case .failure(_):
                textField.textColor = .red
            }
        }
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
