//
//  RatesRatesInteractor.swift
//  CurrencyRateViper
//
//  Created by Vitaly Prosvetov on 12/07/2021.
//  Copyright © 2021 Vitaly. All rights reserved.
//

import Foundation

class RatesInteractor: RatesInteractorInput {
    var service: RateProviding!
    weak var output: RatesInteractorOutput!
    
    func loadRates() {
        service.getRate { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.output.handleRatesLoaded(response.rates)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.output.handleLoadError(error)
                }
            }
        }
    }
}
