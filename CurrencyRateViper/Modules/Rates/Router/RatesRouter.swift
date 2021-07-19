//
//  RatesRatesRouter.swift
//  CurrencyRateViper
//
//  Created by Vitaly Prosvetov on 12/07/2021.
//  Copyright © 2021 Vitaly. All rights reserved.
//

import Foundation
import UIKit

class RatesRouter: RatesRouterInput {
    weak var viewController: RatesViewController!
    
    init(viewController: RatesViewController) {
        self.viewController = viewController
    }
    
    func showDetail(with rate: Rate) {
        let detailVC = DetailViewController(with: rate)
        
        detailVC.modalPresentationStyle = .overFullScreen
        detailVC.modalTransitionStyle = .crossDissolve
        
        viewController.present(detailVC, animated: true)
    }
}
