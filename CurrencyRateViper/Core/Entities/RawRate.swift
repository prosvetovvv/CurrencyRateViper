//
//  RawRate.swift
//  CurrencyRateViper
//
//  Created by Vitaly Prosvetov on 23.07.2021.
//

import Foundation

struct RawRate: Codable {
    var tp, from, to: Int
    var currencyCodeTo: String
    var currencyCodeFrom: CurrencyCodes
    var name, basic, buy, sale: String
    var deltaBuy, deltaSale: String
    
    enum CodingKeys: String, CodingKey {
        case tp, name, from, to, basic, buy, sale, deltaBuy, deltaSale
        case currencyCodeFrom = "currMnemFrom"
        case currencyCodeTo = "currMnemTo"
    }
}

extension RawRate {
    init() {
        tp = 0
        from = 0
        to = 0
        currencyCodeTo = ""
        currencyCodeFrom = .rur
        name = ""
        basic = ""
        buy = ""
        sale = ""
        deltaBuy = ""
        deltaSale = ""
    }
}

extension RawRate: Stubbable {
    static func stub() -> RawRate {
        RawRate()
    }
}
