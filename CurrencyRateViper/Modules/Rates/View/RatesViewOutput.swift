//
//  RatesRatesViewOutput.swift
//  CurrencyRateViper
//
//  Created by Vitaly Prosvetov on 12/07/2021.
//  Copyright © 2021 Vitaly. All rights reserved.
//

protocol RatesViewOutput {

    /**
        @author Vitaly Prosvetov
        Notify presenter that view is ready
    */
    var rates: [Rate] { get }
    func viewIsReady()
    func tappedCell(with rate: Rate)
}
