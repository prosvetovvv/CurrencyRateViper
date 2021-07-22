//
//  RatesRatesViewOutput.swift
//  CurrencyRateViper
//
//  Created by Vitaly Prosvetov on 12/07/2021.
//  Copyright © 2021 Vitaly. All rights reserved.
//

protocol RatesViewOutput {
    func viewIsReady()
    func tappedCell(with rate: Rate)
    func draggedTable()
    func getRate(with index: Int) -> Rate?
    func getRatesCount() -> Int
    func getCurrentDate() -> String
}
