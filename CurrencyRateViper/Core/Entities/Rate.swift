//
//  Rate.swift
//  CurrencyRateViper
//
//  Created by Vitaly Prosvetov on 15.07.2021.
//

import Foundation

struct Rate {
    var currencyName: String
    var country: String
    var currencyCode: String
    var buyPrice: String
    var salePrice: String
    var deltaBuy: Double
    var deltaSale: Double
}

extension Rate {
    init() {
        currencyName = ""
        country = ""
        currencyCode = ""
        buyPrice = ""
        salePrice = ""
        deltaBuy = 0.0
        deltaSale = 0.0
    }
}

extension Rate: Stubbable {
    static func stub() -> Rate {
        Rate()
    }
    
    
}





