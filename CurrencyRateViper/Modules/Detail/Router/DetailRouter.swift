//
//  DetailDetailRouter.swift
//  CurrencyRateViper
//
//  Created by Vitaly Prosvetov on 14/07/2021.
//  Copyright © 2021 Vitaly. All rights reserved.
//

class DetailRouter: DetailRouterInput {
    
    weak var viewController: DetailViewController!
    
    init(viewController: DetailViewController) {
        self.viewController = viewController
    }
    
    func dismiss() {
        viewController.dismiss(animated: true, completion: nil)
    }
}
