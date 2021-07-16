//
//  RatesRatesInteractorOutput.swift
//  CurrencyRateViper
//
//  Created by Vitaly Prosvetov on 12/07/2021.
//  Copyright © 2021 Vitaly. All rights reserved.
//

import Foundation

protocol RatesInteractorOutput: class {
    func handleRatesLoaded(_ result: [RawRate])
    func handleLoadError(_ error: CRError)
}
