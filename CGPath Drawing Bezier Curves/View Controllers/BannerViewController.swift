//
//  BannerViewController.swift
//  CGPath Drawing Bezier Curves
//
//  Created by Shamil Bayramli on 21.06.25.
//

import UIKit

class BannerViewController: UIViewController {
    
    weak var topBannerView: UIView?
    weak var botBannerView: UIView?
    
    var bannerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Banner View"
        label.font = UIFont.systemFont(ofSize: 21, weight: .medium)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = UIColor.tintColor
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = ""
        
        let top = BannerView(frame: CGRect(origin: .zero, size: view.frame.size))
        top.backgroundColor = .white
        self.view.addSubview(top)
        self.topBannerView = top
        
        let bot = BannerView(frame: CGRect(origin: .zero, size: view.frame.size))
        bot.backgroundColor = .white
        self.view.addSubview(bot)
        self.botBannerView = bot
        
        view.addSubview(bannerLabel)
        
        NSLayoutConstraint.activate([
            bannerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bannerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}

class BannerView: UIView {
    override func draw(_ rect: CGRect) {
        createTopLayer(rect)
        createBottomLayer(rect)
    }
    
    func createTopLayer(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.saveGState()
        
        context.beginPath()
        
        context.move(to: .zero)
        context.addLine(to: CGPoint(x: rect.width, y: 0))
        context.addLine(to: CGPoint(x: rect.width, y: rect.height*0.3125))
        context.addCurve(to: CGPoint(x: 40, y: 75),
                         control1: CGPoint(x: rect.width-40, y: rect.height*0.15625),
                         control2: CGPoint(x: rect.width*3/5, y: rect.height*0.09375))
        context.addCurve(to: CGPoint(x: 0, y: 50),
                         control1: CGPoint(x: 10, y: 75),
                         control2: CGPoint(x: 0, y: 65))
        context.addLine(to: .zero)
        
        context.closePath()
        
        context.setFillColor(UIColor.tintColor.cgColor)
        context.fillPath()
        
        context.restoreGState()
    }
    
    func createBottomLayer(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.saveGState()
        
        context.beginPath()
        context.move(to: .zero)
        context.move(to: CGPoint(x: 0, y: rect.height*0.6875))
        
        context.addCurve(to: CGPoint(x: rect.width-40, y: rect.height-75),
                         control1: CGPoint(x: 40, y: rect.height*0.84375),
                         control2: CGPoint(x: rect.width*2/5, y: rect.height*0.90625))
        
        context.addCurve(to: CGPoint(x: rect.width, y: rect.height-50),
                         control1: CGPoint(x: rect.width-10, y: rect.height-75),
                         control2: CGPoint(x: rect.width, y: rect.height-65))
        context.addLine(to: CGPoint(x: rect.width, y: rect.height))
        context.addLine(to: CGPoint(x: 0, y: rect.height))
        
        context.addLine(to: CGPoint(x: 0, y: rect.height*0.6875))
        context.addLine(to: .zero)
        context.closePath()
        
        context.setFillColor(UIColor.tintColor.cgColor)
        context.fillPath()
        
        context.restoreGState()
    }
}
