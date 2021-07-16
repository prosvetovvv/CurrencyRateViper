//
//  UIView+Ext.swift
//  CurrencyRateTestForMKB
//
//  Created by Vitaly Prosvetov on 21.05.2021.
//

import UIKit

protocol BlurEffect {
    func applyBlurEffect()
    func removeBlurEffect()
}

protocol ReuseIdentifier {
    static var reuseIdentifier: String { get }
}

extension UIView: BlurEffect {
    func applyBlurEffect() {
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurEffectView)
    }
    
    func removeBlurEffect() {
        let blurredEffectViews = self.subviews.filter{$0 is UIVisualEffectView}
        blurredEffectViews.forEach{ blurView in
            blurView.removeFromSuperview()
        }
    }
}

extension UIView: ReuseIdentifier {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}


