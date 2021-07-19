//
//  DetailDetailConfigurator.swift
//  CurrencyRateViper
//
//  Created by Vitaly Prosvetov on 14/07/2021.
//  Copyright © 2021 Vitaly. All rights reserved.
//

import UIKit

class DetailModuleConfigurator: DetailConfiguratorProtocol {
    
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        
        if let viewController = viewInput as? DetailViewController {
            configure(viewController: viewController)
        }
    }
    
    func configure(viewController: DetailViewController) {
        let router = DetailRouter(viewController: viewController)
        
        let presenter = DetailPresenter()
        presenter.view = viewController
        presenter.router = router
        
        viewController.output = presenter
    }
}
