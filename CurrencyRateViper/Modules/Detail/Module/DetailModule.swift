//
//  DetailModule.swift
//  CurrencyRateViper
//
//  Created by Vitaly Prosvetov on 20.07.2021.
//

import UIKit

class DetailModule {
    
    private let presenter = DetailPresenter()
    private let rate: Rate
    
    init(with rate: Rate) {

        self.rate = rate
        let viewController = DetailViewController(with: rate)
    
        presenter.view = viewController
        
        viewController.output = presenter
    }
}

extension DetailModule: DetailModuleInput {
    func present(from vc: UIViewController) {
        presenter.present(from: vc)
    }
}
