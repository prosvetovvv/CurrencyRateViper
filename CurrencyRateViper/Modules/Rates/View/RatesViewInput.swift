//
//  RatesRatesViewInput.swift
//  CurrencyRateViper
//
//  Created by Vitaly Prosvetov on 12/07/2021.
//  Copyright © 2021 Vitaly. All rights reserved.
//

protocol RatesViewInput: AnyObject {
        
    func setupInitialState()
    func ratesUpdated()
    func ratesLoadError(_ error: CRError)
}
