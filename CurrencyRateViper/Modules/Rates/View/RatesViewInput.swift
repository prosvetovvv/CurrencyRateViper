//
//  RatesRatesViewInput.swift
//  CurrencyRateViper
//
//  Created by Vitaly Prosvetov on 12/07/2021.
//  Copyright © 2021 Vitaly. All rights reserved.
//

protocol RatesViewInput: AnyObject {

    /**
        @author Vitaly Prosvetov
        Setup initial state of the view
    */

    func setupInitialState()
    func handleRatesChanged()
    func startLoadingSpinner()
    func stopLoadingSpinner()
    func showAlert(with error: CRError)
}
