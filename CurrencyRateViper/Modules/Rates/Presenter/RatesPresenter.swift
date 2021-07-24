//
//  RatesRatesPresenter.swift
//  CurrencyRateViper
//
//  Created by Vitaly Prosvetov on 12/07/2021.
//  Copyright © 2021 Vitaly. All rights reserved.
//

import UIKit

class RatesPresenter {
    private var rates = [Rate]()
    
    var view: RatesViewInput!
    var interactor: RatesInteractorInput!
    var router: RatesRouterInput!
    
    // MARK: - Private
    
    private func getCountryCode(from currencyCode: String) -> String {
        String(currencyCode.prefix(2))
    }
    
    private func formatPrice(input: String, currency: CurrencyCodes) -> String {
        let price = NSNumber (value: (input as NSString).doubleValue)
        
        let formatter = NumberFormatter()
        formatter.currencyGroupingSeparator = " "
        formatter.maximumFractionDigits = 2
        formatter.roundingMode = .down
        formatter.numberStyle = .currency
        
        switch currency {
        case .rur:
            formatter.currencySymbol = "₽"
            
            return formatter.string(from: price) ?? "0.00"
            
        default:
            formatter.currencyCode = currency.rawValue
            
            return formatter.string(from: price) ?? "0"
        }
    }
        
    private func formatRawRate(_ rawRate: RawRate) -> Rate {
        Rate(currencyName: rawRate.name,
             country: getCountryCode(from: rawRate.currencyCodeTo),
             currencyCode: rawRate.currencyCodeTo,
             buyPrice: formatPrice(input: rawRate.buy, currency: rawRate.currencyCodeFrom),
             salePrice: formatPrice(input: rawRate.sale, currency: rawRate.currencyCodeFrom),
             deltaBuy: rawRate.deltaBuy.convertToDouble(),
             deltaSale: rawRate.deltaSale.convertToDouble()
        )
    }
}

// MARK: - RatesViewOutput

extension RatesPresenter: RatesViewOutput {
    func viewIsReady() {
        view.setupInitialState()
        interactor.loadRates()
    }
    
    func tappedCell(with rate: Rate) {
        router.showDetail(with: rate)
    }
    
    func draggedTable() {
        interactor.loadRates()
    }
    
    func getRates() -> [Rate] {
        rates
    }
    
    func getCurrentDate() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        
        return formatter.string(from: date)
    }
}

// MARK: - RatesInteractorOutput

extension RatesPresenter: RatesInteractorOutput {
    func handleRatesLoaded( _ result: [RawRate]) {
        rates = result.map { formatRawRate($0) }
        view.ratesUpdated()
    }
    
    func handleLoadError(_ error: CRError) {
        view.ratesLoadError(error)
    }
}
