//
//  RatesRatesPresenter.swift
//  CurrencyRateViper
//
//  Created by Vitaly Prosvetov on 12/07/2021.
//  Copyright © 2021 Vitaly. All rights reserved.
//

import UIKit

class RatesPresenter: RatesModuleInput, RatesViewOutput, RatesInteractorOutput {
    
    var rates = [Rate]()
    
    weak var view: RatesViewInput!
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
    
    // MARK: - RatesViewOutput

    func viewIsReady() {
        view.setupInitialState()
        view.startLoadingSpinner()
        interactor.loadRates()
    }
    
    func tappedCell(with rate: Rate) {
        router.showDetail(with: rate)
    }
    
    // MARK: - RatesInteractorOutput
    
    func handleRatesLoaded(_ result: [RawRate]) {
        rates = result.map { Rate(currencyName: $0.name,
                                  country: getCountryCode(from: $0.currencyCodeTo),
                                  currencyCode: $0.currencyCodeTo,
                                  buyPrice: formatPrice(input: $0.buy, currency: $0.currencyCodeFrom),
                                  salePrice: formatPrice(input: $0.sale, currency: $0.currencyCodeFrom),
                                  deltaBuy: $0.deltaBuy.convertToDouble(),
                                  deltaSale: $0.deltaSale.convertToDouble()
                                )
        }
        
        view.stopLoadingSpinner()
        view.handleRatesChanged()
    }
    
    func handleLoadError(_ error: CRError) {
        view.stopLoadingSpinner()
        view.showAlert(with: error)
    }
}