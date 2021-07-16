//
//  XButton.swift
//  CurrencyRateViper
//
//  Created by Vitaly Prosvetov on 16.07.2021.
//

import UIKit

class XButton: UIButton {
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: 30, height: 30)
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private
    
    private func setup() {
        backgroundColor = UIColor.darkGray.withAlphaComponent(0.25)
        setImage(UIImage(systemName: "xmark"), for: .normal)
        tintColor = .darkGray
        layer.borderColor = UIColor.systemGreen.cgColor
        layer.cornerRadius = 15
    }
}
