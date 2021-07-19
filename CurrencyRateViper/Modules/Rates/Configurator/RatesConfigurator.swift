//
//  RatesRatesConfigurator.swift
//  CurrencyRateViper
//
//  Created by Vitaly Prosvetov on 12/07/2021.
//  Copyright © 2021 Vitaly. All rights reserved.
//

import UIKit


class RatesModuleConfigurator: RatesConfiguratorProtocol {
    
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        
        if let viewController = viewInput as? RatesViewController {
            configure(viewController: viewController)
        }
    }
    
    func configure(viewController: RatesViewController) {
        let router = RatesRouter(viewController: viewController)
        let network = Network()
        let rateProvider = RateProvider(network: network)
        
        let presenter = RatesPresenter()
        presenter.view = viewController
        presenter.router = router
        
        let interactor = RatesInteractor()
        interactor.output = presenter
        interactor.service = rateProvider
        
        presenter.interactor = interactor
        viewController.output = presenter
    }
}
