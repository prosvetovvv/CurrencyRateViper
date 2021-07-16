//
//  DetailDetailPresenter.swift
//  CurrencyRateViper
//
//  Created by Vitaly Prosvetov on 14/07/2021.
//  Copyright © 2021 Vitaly. All rights reserved.
//

class DetailPresenter: DetailViewOutput {
    
    weak var view: DetailViewInput!
    var router: DetailRouterInput!

    func viewIsReady() {
        view.setupInitialState()
    }
    
    func tappedXButton() {
        router.dismiss()
    }
}
