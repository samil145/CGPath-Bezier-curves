//
//  SquareViewController.swift
//  CGPath Drawing Bezier Curves
//
//  Created by Shamil Bayramli on 21.06.25.
//

import UIKit

class SquareViewController: UIViewController {
    
    weak var sqaureView: UIView?

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        sqaureView?.center = view.center
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let square = SquareView(frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 100)))
        view.addSubview(square)
        sqaureView = square
    }
    
}

class SquareView: UIView {
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        context.saveGState()
        do {
            context.restoreGState()
        }
        
        context.beginPath()
        context.move(to: .zero)
        context.addLine(to: CGPoint(x: rect.width, y: 0))
        context.addLine(to: CGPoint(x: rect.width, y: rect.height))
        context.addLine(to: CGPoint(x: 0, y: rect.height))
        context.addLine(to: .zero)
        
        context.closePath()
        
        context.setFillColor(UIColor.tintColor.cgColor)
        context.fillPath()
    }
}
