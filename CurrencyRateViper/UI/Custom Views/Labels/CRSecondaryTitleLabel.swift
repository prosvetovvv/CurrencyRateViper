//
//  CRSecondaryTitleLabel.swift
//  CurrencyRateTestForMKB
//
//  Created by Vitaly Prosvetov on 17.05.2021.
//

import UIKit

class CRSecondaryTitleLabel: UILabel {
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
        font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
    }
    
    // MARK: - Private
    
    private func setup() {
        textColor = .secondaryLabel
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.90
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}
