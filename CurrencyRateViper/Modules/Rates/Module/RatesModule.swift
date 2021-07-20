//
//  RatesModule.swift
//  CurrencyRateViper
//
//  Created by Vitaly Prosvetov on 20.07.2021.
//

import UIKit

class RatesModule {
    private let viewController: RatesViewController
    
    init() {
        self.viewController = RatesViewController()
        
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

// MARK: - RatesModuleOutput

extension RatesModule: RatesModuleOutput {
    func createVC() -> RatesViewController {
        viewController
    }
}
