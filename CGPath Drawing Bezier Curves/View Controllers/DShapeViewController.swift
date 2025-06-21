//
//  DShapeViewController.swift
//  CGPath Drawing Bezier Curves
//
//  Created by Shamil Bayramli on 21.06.25.
//

import UIKit

class DShapeViewController: UIViewController {

    var dShapeView: UIView?
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        dShapeView?.center = self.view.center
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dShape = DShapeView(frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 100)))
        dShape.backgroundColor = .white
        self.view.addSubview(dShape)
        self.dShapeView = dShape
    }
}

class DShapeView: UIView {
    final let strokeWidth: CGFloat = 5
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.saveGState()
        defer {
            context.restoreGState()
        }
        
        context.beginPath()
        
        context.move(to: CGPoint(x: strokeWidth, y: strokeWidth))
        context.addCurve(
            to: CGPoint(x: strokeWidth, y: rect.height - strokeWidth),
            control1: CGPoint(x: rect.width * 0.75, y: strokeWidth),
            control2: CGPoint(x: rect.width * 0.75, y: rect.height - strokeWidth))
        context.addLine(to: CGPoint(x: strokeWidth, y: strokeWidth))
        
        context.closePath()
        
        context.setFillColor(UIColor.white.cgColor)
        context.setStrokeColor(UIColor.tintColor.cgColor)
        context.setLineWidth(5)
        
        context.strokePath()
        context.fillPath()
    }
}
