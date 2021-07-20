//
//  DetailDetailPresenter.swift
//  CurrencyRateViper
//
//  Created by Vitaly Prosvetov on 14/07/2021.
//  Copyright © 2021 Vitaly. All rights reserved.
//

import UIKit

class DetailPresenter: DetailViewOutput {
    
    var view: DetailViewInput!
    
    func viewIsReady() {
        view.setupInitialState()
    }
    
    func tappedXButton() {
        self.dismiss()
    }
    
    func dismiss() {
        view.dismiss()
    }
}

// MARK: - DetailPresenterInput

extension DetailPresenter: DetailPresenterInput {
    func present(from viewController: UIViewController) {
        view.present(from: viewController)
    }
}
