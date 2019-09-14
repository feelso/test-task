//
//  Task3VC.swift
//  TestTask
//
//  Created by Arsen on 9/14/19.
//  Copyright © 2019 Arsen. All rights reserved.
//

import UIKit

class Task3VC: UIViewController {

    var shapeLayer: CAShapeLayer!
    var trackLayer: CAShapeLayer!
    var pulsatingLayer: CAShapeLayer!
    var percentageLabel: UILabel!
    var number: CGFloat = 0.4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1842939258, green: 0.1843264103, blue: 0.1842868626, alpha: 1)
        setupViews()
        setupCircleLayers()
        
    }
    @IBOutlet var sliderView: UIView!
    
    func setupViews() {
        percentageLabel = {
            let label = UILabel()
            label.text = "40%"
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 32)
            label.textColor = .white
            return label
        }()
        
        let textLabel: UILabel = {
            let label = UILabel()
            label.text = "Рейтинг побед"
            label.numberOfLines = 2
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 15)
            label.textColor = .white
            return label
        }()
        
        sliderView.frame = CGRect(x: 0, y: 0, width: view.frame.width - 100, height: 30)
        view.addSubview(textLabel)
        view.addSubview(percentageLabel)
        percentageLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        textLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 70)
        percentageLabel.center = CGPoint(x: view.center.x, y: view.center.y - 20)
        sliderView.center = CGPoint(x: view.center.x, y: view.center.y + 200)
        textLabel.center = CGPoint(x: view.center.x, y: view.center.y + 20)
    }
    
    
    @IBAction func sliderAction(_ sender: UISlider) {
        number = CGFloat(sender.value / 100)
        animateBlueCircleTo(value: number)
        animateGrayCircleTo(value: number)
        percentageLabel.text = "\(Int(sender.value))%"
        
    }
    
    private func createBlueCircleShapeLayer(strokeColor: UIColor, fillColor: UIColor) -> CAShapeLayer {
        let layer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 100, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: false)
        layer.path = circularPath.cgPath
        layer.strokeColor = strokeColor.cgColor
        layer.lineWidth = 14
        layer.fillColor = fillColor.cgColor
        layer.position = view.center
        return layer
    }
    
    private func createGrayCircleShapeLayer(strokeColor: UIColor, fillColor: UIColor) -> CAShapeLayer {
        let layer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 100, startAngle: 0 , endAngle: 2*CGFloat.pi, clockwise: true)
        layer.path = circularPath.cgPath
        layer.strokeColor = strokeColor.cgColor
        
        layer.lineWidth = 14
        layer.fillColor = fillColor.cgColor
        layer.position = view.center
        return layer
    }
    
    
    private func setupCircleLayers() {
        
        let color: UIColor = #colorLiteral(red: 0.2650902867, green: 0.7006292939, blue: 0.9611788392, alpha: 1)
        let color2: UIColor = #colorLiteral(red: 0.6117095947, green: 0.611800015, blue: 0.6116898656, alpha: 1)
        trackLayer = createGrayCircleShapeLayer(strokeColor: color2 , fillColor: .clear)
        trackLayer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
        
        //СЕРЫЙ
        trackLayer.strokeStart = CGFloat(0.5).toRadians()
        trackLayer.strokeEnd = 1 - number - CGFloat(0.5).toRadians()
        view.layer.addSublayer(trackLayer)
        
        //СИНИЙ
        shapeLayer = createBlueCircleShapeLayer(strokeColor: color, fillColor: .clear)
        shapeLayer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
        shapeLayer.strokeStart = 0
        shapeLayer.strokeEnd = number
        view.layer.addSublayer(shapeLayer)
    }
    
    fileprivate func animateBlueCircleTo(value: CGFloat) {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        
        basicAnimation.duration = 0.05
        
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.strokeEnd = value
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
    }
    
    fileprivate func animateGrayCircleTo(value: CGFloat) {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        
        basicAnimation.duration = 0.05
        
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        if value == 0 {
            trackLayer.strokeStart = 0
            trackLayer.strokeEnd = 1 - value
            trackLayer.add(basicAnimation, forKey: "urSoBasic")
        } else {
            trackLayer.strokeStart = CGFloat(0.5).toRadians()
            trackLayer.strokeEnd = 1 - value - CGFloat(0.5).toRadians()
            trackLayer.add(basicAnimation, forKey: "urSoBasic")
        }
    }
    
}

