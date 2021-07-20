//
//  RatesRatesViewOutput.swift
//  CurrencyRateViper
//
//  Created by Vitaly Prosvetov on 12/07/2021.
//  Copyright © 2021 Vitaly. All rights reserved.
//

protocol RatesViewOutput {

    var rates: [Rate] { get }
    var currentDate: String { get }
    
    func viewIsReady()
    func tappedCell(with rate: Rate)
    func draggedTable()
}
