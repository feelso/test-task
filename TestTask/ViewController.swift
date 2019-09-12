//
//  ViewController.swift
//  TestTask
//
//  Created by Arsen on 9/10/19.
//  Copyright © 2019 Arsen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let width: CGFloat = 160
    let height: CGFloat = 160.0
    var path = UIBezierPath()

   
    let viewImage = UIImageView()
    let textLabel = UILabel()
    let buttonAction = UIButton()
    let textField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.addTarget(self, action: #selector(textFieldChanged), for: .allEditingEvents)

        setupViews()

    }

    func setupViews() {
        textField.delegate = self

        if let url = URL(string: "https://images.dog.ceo/breeds/pomeranian/n02112018_5482.jpg"), let imgData = try? Data(contentsOf: url) {
            let image = UIImage(data: imgData)
            
            viewImage.image = image
            viewImage.frame = CGRect(x: view.frame.width / 2 - width / 2 , y: 100, width: 160, height: 160)
            halfCircleMaskFor(imageView: viewImage)
            addMaskPathFor(image: viewImage)
        }
        textLabel.text = "5"
        textLabel.font = UIFont.systemFont(ofSize: 30)
        textLabel.frame = CGRect(x: view.center.x + width / 4 + 10, y: 155, width: 25, height: 50)
        
        
        textField.frame = CGRect(x: view.center.x - 50, y: view.center.y, width: 100, height: 30)
        textField.borderStyle = .roundedRect
        textField.placeholder = "Number"
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        
        buttonAction.frame = CGRect(x: view.center.x - 50, y: view.center.y + 50, width: 100, height: 30)
        buttonAction.setTitle("Change", for: .normal)
        buttonAction.backgroundColor = .gray
        buttonAction.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        
        self.view.addSubview(textField)
        self.view.addSubview(buttonAction)
        self.view.addSubview(viewImage)
        self.view.addSubview(textLabel)
    }
    
  @objc func buttonTapped(sender: UIButton!) {
    guard !textField.text!.isEmpty else { return }
    guard let text = textField.text else { return }
        textLabel.text = text
        textField.resignFirstResponder()
    }
    
    func addMaskPathFor(image: UIImageView)  {
        let layer = CAShapeLayer()
        layer.path  = path.cgPath
        image.layer.mask = layer
    }
    
    func halfCircleMaskFor(imageView: UIImageView) {
        path = UIBezierPath()
        
        path.addArc(withCenter: CGPoint(x: imageView.frame.width / 2  , y: imageView.frame.height / 2),
                                                    radius: 60,
                                      startAngle: CGFloat(25.0).toRadians(),
                                      endAngle: CGFloat(-25.0).toRadians(),
                                      clockwise: true)
    
        path.addCurve(to: CGPoint(x: 115, y: 80), controlPoint1: CGPoint(x: 118, y: 68), controlPoint2: CGPoint(x: 115, y: 73))
        path.addCurve(to: CGPoint(x: 121, y: 95), controlPoint1: CGPoint(x: 115, y: 86), controlPoint2: CGPoint(x: 117, y: 90))
        path.close()
     
    }

}

extension ViewController: UITextFieldDelegate {
    
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
